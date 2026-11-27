Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E77606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yBKtPxLB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nIvAc5+y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9QASW/nQFRwckZtkKScSXoTMKPbwzm+lBFMqrjF4EN4=; b=yBKtPxLBQ2kI19
	m33mOyIEgSN3gv50NWE7DGeWHUk1/bJRwz4B9XoBSuzS42hQMAEHoKH6MplwJYdb3tIM4oyGqSUmM
	px/IUDUVJQd51/v859EMqO+ykeEPK/TEsGrL888onc6AjV5kVKYg08copB5AZJAKadxX23vDn27Z6
	9HJEp3Rb1QmaNb2o3pRzBEyr2eWwRMH7j2z67GWM084DrHDqPRTAIuhCn+0zgCYZRNEalHdFbfn67
	Ml7zYNwc7sj61sTpp3ArI8TfKzUOczp+g8i76H5VQ04i1pr1w+II+2+vqE1cuLYHtYLatKmEY671t
	MktL9zhRuV7OgNtGLmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdh-0000000FAAH-10jw;
	Fri, 27 Nov 2026 07:45:01 +0000
Received: from out-129.mta1.migadu.com ([2001:41d0:203:375::81] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdE-0000000FA1O-2bxh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:44:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=wWPnTVaNR02s/u6p1bUwAEswVlCSylV2VmELoXM6mc0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765471; v=1; x=1796370271;
 b=nIvAc5+yw+FnYcUISj6Cnr5AjM+sEHKTrFp0fLS5B4TDvgjb3s8PRiEwL8CAYfSGb1bfhkhh
 /wLgT8dgVSYpwBmlCxHz5iebZwBUC/94h/enTiGrooQucRf4uM8lAJ6Gs4aqplRzE4BoXNkmD4x
 w5EGc+7VU8tSzg+UuBaNv2yE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ebfebde42fe19989;
	Fri, 27 Nov 2026 07:44:31 +0000
X-Mizu-Trace-ID: ebfebde42fe19989
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
Subject: [PATCH v2 01/10] arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
Date: Fri, 27 Nov 2026 07:44:17 +0000
Message-ID: <20261127074426.50739-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234432_864229_7E5D7562 
X-CRM114-Status: GOOD (  10.49  )
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

MPAM1_EL12 is the EL12 alias of MPAM1_EL1, but its entry in the sysreg
file is "Fields MPAM1_ELx", and the file doesn't have an MPAM1_ELx
block. Since commit 6ae7fab7d9d33 ("arm64: sysreg: Emit RESx/UNKN values
for Mapping/Fields definitions"), the generator's MPAM1_EL12_RES0, _RES1
and _UNKN expand to MPAM1_ELx_RES0 and the like, which aren't defined.
They aren't used yet, but the first user would fail to build.

Describe the register as a mapping of MPAM1_EL1.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/sysreg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 997c62ab72e68..ebe5c5bd6fef6 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -5501,7 +5501,7 @@ Field	63:0	ADDR
 EndSysreg
 
 Sysreg	MPAM1_EL12	3	5	10	5	0
-Fields	MPAM1_ELx
+Mapping	MPAM1_EL1
 EndSysreg
 
 Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
-- 
2.47.3


