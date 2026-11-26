Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A04F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vzwHuzCK;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g7L2HRRN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2S/oZLZTT9f3qlYq/XC7o5Hag90eTEHtjkMZtGEzJxs=; b=vzwHuzCKB2V0Ku
	/H2qBctQUcvN+HJOlsnC9JehdjG0IMB73XvxJ+U5zpfRcmOfvg6vX4zGYbpcw0TKAoOvK89mrlsiw
	wg9bN8vroD8tnw4ImTyFDHr7YGBHUaz7OKbajhEnCziXravUvpCpe15w7c2n6VHdi6+a5P3qjPR8+
	4NSzkEJSZQwgm+umo3iqXjH0WGQ5G4Q2sOqi/hmnqhH/z+2V960xMRBEV1MK4JDzqhgQ2ldxGIvhP
	0xzjyRPurKzo5rW36aaj1PSbzq0vK8chCKfoZ0K8NL/ElbAyEAqFgHdGWnhnwxyHM6y1dmChT3VlT
	gAe6WsdCQ34GHCYnbE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzY-0000000D3ua-2D14;
	Thu, 26 Nov 2026 11:50:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXzN-0000000D3qa-1rIK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:50:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B843A1CE2;
	Thu, 26 Nov 2026 03:50:05 -0800 (PST)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 556463F632;
	Thu, 26 Nov 2026 03:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795693808; bh=qJYRR+auXt60sDD5z7pZDCBtdiRPKzJH61ZeXsXTu3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g7L2HRRNlf9cMEVESKmWUZNsFgw2UWg5mPpQlYEQQcpnWpkT/NRDGHk2kdXiCE9Jl
	 PTjFBFzgAZMw+iKRetgUAgF6/rQJ65WRLfGINWXP6qmE3GvGRG6zu/3fkcVVbPeLJ+
	 80qCxZg+9QTMiU3NRp5zv5asd9cyKvj6VSNi2hEg=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [RFC v2 01/13] arm64: sysreg: Add definitions for TLBID
Date: Thu, 26 Nov 2026 11:49:24 +0000
Message-ID: <20261126114936.864256-2-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126114936.864256-1-kristina.martsenko@arm.com>
References: <20261126114936.864256-1-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035009_590705_E98EEA39 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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

Describe new system registers and fields added by FEAT_TLBID, so that
later patches can use them. This is based on the latest system register
specifications (version 2026-09, see Link).

The size and number of fields in VTLBID* registers is determined by
information in other registers at runtime, so can't be described
statically here.

Link: https://support.arm.com/architectures/a-profile-architecture#Downloads
Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/tools/sysreg | 53 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 997c62ab72e6..d7fbffba9235 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4374,7 +4374,9 @@ Field	0	nPMECR_EL1
 EndSysreg
 
 Sysreg	HFGRTR2_EL2	3	4	3	1	2
-Res0	63:15
+Res0	63:31
+Field	30	nTLBIDIDR_EL1
+Res0	29:15
 Field	14	nACTLRALIAS_EL1
 Field	13	nACTLRMASK_EL1
 Field	12	nTCR2ALIAS_EL1
@@ -4594,14 +4596,16 @@ Fields	ZCR_ELx
 EndSysreg
 
 Sysreg	HCRX_EL2	3	4	1	2	2
-Res0	63:35
+Res0	63:37
+Field	36	FNB
+Field	35	VTLBIDOSEn
 Field	34	NVnTTLBOS
 Field	33	NVnTTLBIS
 Field	32	NVnTTLB
 Res0	31:28
 Field	27	NVTGE
 Field	26	SRMASKEn
-Res0	25
+Field	25	VTLBIDEn
 Field	24	PACMEn
 Field	23	EnFPM
 Field	22	GCSEn
@@ -4751,6 +4755,38 @@ Res0	25:19
 Field	18:0	INDEX
 EndSysreg
 
+Sysreg	VTLBID0_EL2	3	4	2	8	0
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBID1_EL2	3	4	2	8	1
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBID2_EL2	3	4	2	8	2
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBID3_EL2	3	4	2	8	3
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBIDOS0_EL2	3	4	2	9	0
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBIDOS1_EL2	3	4	2	9	1
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBIDOS2_EL2	3	4	2	9	2
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBIDOS3_EL2	3	4	2	9	3
+Field	63:0	TD
+EndSysreg
+
 Sysreg	DACR32_EL2	3	4	3	0	0
 Res0	63:32
 Field	31:30	D15
@@ -5798,6 +5834,17 @@ Res0	16
 Field	15:0	PARTID_MAX
 EndSysreg
 
+Sysreg	TLBIDIDR_EL1	3	0	10	4	6
+Res0	63:45
+Field	44:40	NVOS
+Res0	39:37
+Field	36:32	NOS
+Res0	31:13
+Field	12:8	NVIS
+Res0	7:5
+Field	4:0	NIS
+EndSysreg
+
 Sysreg	LORID_EL1	3	0	10	4	7
 Res0	63:24
 Field	23:16	LD
-- 
2.43.0


