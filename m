Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4B4ytqZ1;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ubb1k2qp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3nDpLZt0Hs5OH5kFHB3f7/OYmF7wFFbjKAlxawdFe74=; b=4B4ytqZ1ox5rJi
	f7Hx81L3m+hCIk17+GNnlPT0/laX2SVNYbi/jam/+a3fJlbmhlydzPttIAIVRhjQgiR+jfZHGK6PS
	TTRz6UFn8fvIz8f4QuR9WWeKJkmLB78D5euG/emtOfVtBNH71+WWCyVf1JbgxfW09lAU86qfh8aTO
	eK5Du3vBAJWSTUX7qdD8FC2L2lt3vnajIS78Wj+Mv9DOzqxHMz6Zjny1Y0U83Y8TkcCZtdOsx/9DK
	38Sri2Ks6fvRY3bBAXgP+TECPePPdEpOZxFnZyN4WET5t6JOjJphaSqBzOjQUi3Jpupo4gTyYO2gb
	PF24XkVp4hA/iZvkL3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOrA-00000002Usw-2h1d;
	Mon, 23 Nov 2026 07:52:56 +0000
Received: from out-155.mta1.migadu.com ([2001:41d0:203:375::9b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOqq-00000002UiU-067Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:52:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rQou9DwptRL140fMbBjIWfFbsdtKmSPSbIJAMhXyGSo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420354; v=1; x=1796025154;
 b=Ubb1k2qph+HARyWmnvn3g/4oNX3dMnxcfjsw1lJcKDlp2vHROce4o1NHAM3K0wGfYMz9EpN4
 YIFVP2HnUiGQgtIwNHWeYqyyehK8ttePG6e0MIlnzy6v7a1xeT2JEG+Bm3G1Xe8CO0oAqrq0cEj
 INhYwNnAJ54Pr0p4ZZ0s6BBk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 487a0c2e7dd4d38f;
	Mon, 23 Nov 2026 07:52:33 +0000
X-Mizu-Trace-ID: 487a0c2e7dd4d38f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 4/9] arm64: sysreg: Don't run the end-of-file checks after an error
Date: Mon, 23 Nov 2026 07:52:14 +0000
Message-ID: <20261123075219.369042-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235236_426956_1C61BD60 
X-CRM114-Status: GOOD (  11.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

fatal() ends the run with exit, but awk still runs the END rule after
it, and END checks the file as though it had been read to the end. An
error inside a block leaves that block open, so the error is followed by
a second, bogus one about a missing terminator.

Skip the END checks once fatal() has run.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 8ce4981273dd3..c4fa27cd9beff 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -19,6 +19,7 @@ function fatal(msg) {
 	}
 	printf "\n"
 
+	__fatal = 1
 	exit 1
 }
 
@@ -116,6 +117,10 @@ BEGIN {
 }
 
 END {
+	# fatal() exits before the whole file is read, and exit still runs END.
+	if (__fatal)
+		exit 1
+
 	if (__current_block_depth != 0)
 		fatal("Missing terminator for " block_current() " block")
 
-- 
2.47.3


