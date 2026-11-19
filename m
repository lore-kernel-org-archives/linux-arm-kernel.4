Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF888606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DFyrlZdu;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SoPw2bI2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tjwBrxu6kChXxohWi61PRkXDbDFsaneYyYkynhYDCr8=; b=DFyrlZdu97QRna/aToHDAOXFva
	OlxoLn71D76IAwAvKhD8r+y7XzuYmAoU7wUJK51yu7wI7RnJCZB2UAA3c4TDxovgmq4ZZSExwUgDT
	qNHjVnAtqwh+kO6DhmLV3xCSsKZBUimHPgKJ3Lx/dO4OCYfSt7g5l0cpUkA0f0XMRNEE2S4pXBV4t
	muXd9AZjVrkAKG/B4hhVx43p/aa2R5ajXp7Gxmo8NSeV4+i1kdYCihAQ08GEiBPObt6cXhaRRY4C/
	23JLFAWH9mi28WiKDtoi8/cRRtWLnPPrilCw2qXw0iPY+Y37DKF+1JsFst1fxp44KOvzf8HRMKZpx
	fHd42Qeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2qj-0000000CBIx-0qX5;
	Thu, 19 Nov 2026 14:10:53 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2qf-0000000CBHb-34kx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:10:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJVvnogOvwyP9CYvA40HfK2JeBpk6Lrm7NTx3S434JXcWiR9a4KmFxymuipKbq88DwdtI6fvRnDEQVfRgFxEHgNzwVMkk48E+hw4fdfZVUwj4CQUDfWIwLNnYugLAb2J4FO95WpMI0WQHO9Cl4xiTicl5PlYxzoYaZpGhNWybEdJPY4cH+HsLnSqqEUq+bg5Shrovh/8GCYWZWGFhmnnVLQ4/t7D9zhP0c+gjcEGMuHVnW9AI2/5CHdb6qRfvursSR9jUqthaDJVDqkrFHog9vHD2yP5j3XooilM/IcRmJeoDXVcqKMZ5DhUOauI7NNC9TSu+kH1V2k6fqKSyv7PEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjwBrxu6kChXxohWi61PRkXDbDFsaneYyYkynhYDCr8=;
 b=e+v/q4lWKmjiAwO8ZyMLuWd2eyEzfJojJZ5n5CAk84mX1SqtTd7OyyOerNpVVEYcpcuQI8nJa/DypxKpT5k3R2GV59cO7Bvy364qROewMld4oR7htbTVkYs6oMRmHnNvKlFAYd2mjNXa8/rWsnqf/z33TfDQz6BTlJxln+hLTdpuVDANu0ufUfsPDnkbBhGKRcBxgDYV3MrKEaD5V1EY3FxZ7osFgXIp3UKvNjGMP4Vs/kAuONSz7SWQYSYo3RajCXBdMT5Gn6CfwXasamx8hS4En8Ogzs/Av+FRrHMXYK8Xvp0zqffvQVkMlw4YqGdI2w84DiLKl+mTBiipXfzK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjwBrxu6kChXxohWi61PRkXDbDFsaneYyYkynhYDCr8=;
 b=SoPw2bI26ogu8Jjpu+pYvCwPbPkkPXe36I0mhOwU8L0rDbxNaoKXfs9D0LInuqPLnobxNlcIsSUZyUjN5qkCLsis4FMsGv2dTVvGLP/jmJ8fk1umqXAioZFuOwvqUrbZWqPjsT+1RXwBOO2gm1/4+lyIl9hMaDE+oc+Ia5rVFaw=
Received: from PH0PR07CA0092.namprd07.prod.outlook.com (2603:10b6:510:4::7) by
 DSAPR12MB473869.namprd12.prod.outlook.com (2603:10b6:8:518::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:10:44 +0000
Received: from PH1PEPF00062F24.namprd02.prod.outlook.com
 (2603:10b6:510:4:cafe::9c) by PH0PR07CA0092.outlook.office365.com
 (2603:10b6:510:4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 14:10:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH1PEPF00062F24.mail.protection.outlook.com (10.167.243.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:10:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 08:10:40 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 08:10:38 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: zynqmp: dts: Drop incorrect #phy-cells from eth phy on KD240-revA
Date: Thu, 19 Nov 2026 15:10:32 +0100
Message-ID: <c3cca9923c2cb23ed17970f7ca12d597a7027142.1795097431.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=michal.simek@amd.com; h=from:subject:message-id; bh=pD/ITgwzcYROZqQKTMQKjynMuyjLAFmqv6b/+VKjQv8=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9Z44yFwm7ZXtJgL/Z0KhQPuVST61R0Xk2q7LI6UtFr 5uvcE/uKGVhEONgkBVTZJnOpOOw5tu1pWLLI/Nh5rAygQxh4OIUgImIFjMyrNp3Y1bfjF1sLdyb ZCN3yTXai6T4zTRylv1zinOiSemV54wMq0Ort8/RO/PZ6eW2rdl9vxfvWX7YTe1yUJ6A3JSdPvU 9PAA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F24:EE_|DSAPR12MB473869:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb89f22-ab2a-44fe-ffca-08df4646e6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|10067099003|56012099006|11063799006|261021123027099003|261009223027099003|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info: F6kWVfzmapS5aemoXFV8EtS5K7uja/hcTf5F5e82CWRrcu4lbBbzc5Eo/TZLVPcOr98Uqjwg/Bdd3TIwyVUjBIzm/K2tMqZ2BuqWnrEXCHGjCZVQ1qLDHtrFH3PL3mfjZ+Fepv5TXjBbwHdWWAulrKKQO0cT96uX1f1QfahCxWD/8NGwfqYVD8Fvw/DoN4WLZzo/S6U/SHIdXsfHAOwpRZ6sZ9AGDDanRyeO4keMjW6r9Fmwt+WgED6XjhtbODp/8cjeRwdVfM4a5PyTpijBMYzLRQ7DVCdlT3FQDgviyf+IaLsY8EmxsbM5WjagNK1EOszAsieIL6dB35Uu1skL9x4VjIu4RUBj8CnlBSv9Jl2DsjVukYQ8THBhkoNP8Ms4x9gITv3Cnn/FjvdtvMaKrfEIXQKJFGKK/N2jg7GXhC9V2t+6NpS/ht1efyYHoouwHVETJa3YhfMKl1uevg1+fycdGBZ/VppoZtKCh7hiEzdxun+dRtDzIa94yVA3EVeZ1fyLVSpvX2PYgWWxkbIDp/eGiQ+yI0DOsPO3eWgYdXacpi0qsszYl24576osfFzhlhr61pfSGUT/VJx25djooLedWWZyN4DVjoWRYzYv2kraQEPXqQ7k2PGMBIaNjacJlg03eNkyN4nXn1uMVM1msg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261026121527099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CKh1UbzGHaxavI1dMpfPtz0tBLsbQ/LshDy/UGWKXLD23zk2lDsHrGb/jZ6DHUFCTF9pFjm7YI4HWw63h70gbzMhMbXXR9yhy2horO1N4MZkwmq5YstMl+h4mjvrcSsphmG6WwvTNCWXWo1znXUt0jzDLtb9hML792VuUfk+K9pCL2u1gvVVY3MJM99ApYwpjc7CuE2BnYqWBJi1XSrS9dwZyEMfhA1mNTol8n6Sfp+IoK2fNJxVybcORiatz8bghisKWLHFUt4Sfj4KX0J5P7GKFibr/b+dxurJJnsm/VdaEyMMzDbAnjbtiQ+0SmhYi0ZcnV/8tnxX5HqdQqR7Uz16WF9XoTr/K1n6O145tB5LCYVLHK8lBHvbaBU6Ja/ikTxHJr1xPL5b8OR4fWkUlOS8ZcqCG4zuvzjaIzTLye2XbJHzt5/b+Fo0tn07MYiv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:10:44.1212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb89f22-ab2a-44fe-ffca-08df4646e6b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH1PEPF00062F24.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSAPR12MB473869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_061049_804257_368C287F 
X-CRM114-Status: GOOD (  10.26  )
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

The #phy-cells property is meant for generic PHY providers
(Documentation/devicetree/bindings/phy/phy-bindings.txt) and is not a
valid property for ethernet-phy nodes.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

The same change was done here but KD240 was missing there.
https://patch.msgid.link/20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutronix.de
---
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
index 23f6695d86b4..ffc14b1f871f 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
@@ -140,7 +140,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@8 { /* Adin u31 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id0283.bc30";
 			reg = <8>;
 			adi,rx-internal-delay-ps = <2000>;
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

-- 
2.43.0


