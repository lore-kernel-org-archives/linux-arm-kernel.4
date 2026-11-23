Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DED606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wU95XJ4P;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VY716lNV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p4WNrnTmjL11PBLlIs9x7E6Ygb6cyG3MjAKmtC16Sv4=; b=wU95XJ4PAsyR59
	Umkumwn3FhM45UGlRkcifnu4JkIvToLjNsouJm2hhN0ROaeiXrhsDzaaop7U54mB9yBzUflHfWSSb
	z0STbVomcUqNRIm2N1HrJkcNVugbgsJhfTplP8XdBvuY6N7vyOFGir7m3XhQwujJ/2UYt4hS1Lhj6
	xHHj62+EOVqec5mw6VS4YynvSFiIYLB1owNTOfxf4QcBR7MVIw+wqB+1eIHrxXt05AUKUE4Gpiuib
	AEV06Xt/utIyUNkgIMUpfG5++dhVYEqCHoPSw2WsUGggaPuTY5/WAYYCipOcW8fL9yRSRxAwrjr0C
	MuS4DvBZk+uH9FRgFy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOtC-00000002VHH-2VqX;
	Mon, 23 Nov 2026 07:55:02 +0000
Received: from out-168.mta1.migadu.com ([2001:41d0:203:375::a8] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOr9-00000002Uqy-3WSa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:52:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=W5MVlLabdoLJygsTruEB+0zDUQy4ednpuAK/pgs3G7I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420373; v=1; x=1796025173;
 b=VY716lNVIxIbgQa2xjy1B3kXj8KVdp0PaNMCrNqxSeGX2H3rgx3ZlMHFzdPetNupB7Cy5JS4
 OYvA6wF4NMq4mqP9aQa8Q6RnEcS588R950n9tRm8b4h6JsT2qU9XkESj3l/GbNG497JQE90nDPz
 HN8H6+deX0eoBaTg+SwLopbU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 17f89cfd84a43798;
	Mon, 23 Nov 2026 07:52:53 +0000
X-Mizu-Trace-ID: 17f89cfd84a43798
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
Subject: [PATCH 7/9] arm64: sysreg: Reject a macro name defined twice
Date: Mon, 23 Nov 2026 07:52:17 +0000
Message-ID: <20261123075219.369042-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235256_280538_EF4917F0 
X-CRM114-Status: GOOD (  10.69  )
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

The generator rejects a duplicate register, SysregFields block, prefix
or enum value, but not two definitions of the same macro. Two fields
called F in REG make it emit REG_F twice with different masks, which the
compiler reports only as a redefinition warning against the generated
header, in every file that includes it. Two values of one enum sharing a
name do the same, and so do names that collide only once the generator
joins them: a field A_B beside value B of field A, a field F_MASK beside
F, or a field B_C in FOO beside a field C in FOO_B.

Record every macro name the generator defines, and fail on the second
definition. This covers a duplicate block or prefix too, but their own
checks stay, since they report the duplicate at the block's own line, by
block name.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index cde526896ed96..0bd6aab8aae0f 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -46,6 +46,10 @@ function expect_fields(nf) {
 # Print a CPP macro definition, padded with spaces so that the macro bodies
 # line up in a column
 function define(prefix, name, val) {
+	if ((prefix name) in defined_macros)
+		fatal("Duplicate macro " prefix name)
+	defined_macros[prefix name] = 1
+
 	printf "%-56s%s\n", "#define " prefix name, val
 }
 
-- 
2.47.3


