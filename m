Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BA660A6F6F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y19248k/;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rrOQ8Jjp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2LaPr75fWOvdBgk5NzGOT1ZxS0KLZefh5QA6CT99MCY=; b=y19248k/EsazWr5FxrdY/KmAAX
	9q4quJKo4UV6kifSAHvuDQa0KzvMm/BFisQMtUORFPOiRshJE/CudIJq9nNxPK6Pe8uDiHMjDGg2N
	+VWEEfkiXjQsOyZnZuGSMv+zsODJnqsBQx/pxXlB/Up6/0iQK66QRhGWn4S/w4O1QHo3mof5RTE+Z
	6RHi3NV9d/53qQAlPqArWENCxByrm4PEHn4UfqQp/MxV8+GimYqqGmEgeIF9wpEw5e3/aGzQ6mN3g
	q5aA5dxd7hiJi80UarZCyrKMqc4tLtzpwv9640lD0IGD2shU8GLeWKFkDSvkKACZUeqZvCMz+XAd0
	/yOBVVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp8p-0000000AV5W-2AKp;
	Wed, 18 Nov 2026 23:32:39 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp8f-0000000AV0h-1IFy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:32:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN4B2qHLDIq2H7wwU6Ak4YTgZ+HbCsy5hRDvR8N+4L7+xMzEX/06k86K8MvJDWb4yH0lemSgKUgvMOML01CnYvUwGFNN78pUOR2i3kdRL3ifjEKufzCNSGwb64y7lvWbyQrvQfgardhHGkGV08L506PhjQeARADrMg6jsvArCOMD3qUlin+Fo58adnHkBCKst40IUAcIzv6Wy9Lio6VsXjwp/E1cfySvx9ZhWttvoEzMkfEoPAzYqWhZORdfNm1e5DZ0IYFPzurbFMT4O5QV57uJhY/SJsiDCyzZUf82pS+s/miPTqbXAt9GfIrUoO92LZOapbby/0j7LxDTPGptKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LaPr75fWOvdBgk5NzGOT1ZxS0KLZefh5QA6CT99MCY=;
 b=iX8CDFXwFJylB1sfeW3Vv7TvJCAtK631PkcnuaehzPGQdNERUN7w0c0Uk7iYakm5q5p8bORhim/stuThy0oOreW/tteErpkR1ONwIVOzaMJiS5+TADU3Hu+K4FWiyQ1nmROIZUVJRma7LET0v4mtMXsgPOkRa5dDJD5n8XHXxIbjxmvdQ/mVygSMrgJeVjbC1kXo/NGfnDKK9nr7MQy8t6Ta16Y9IdNKt8uNnoW1S7dRZLCKQi8FFqesLAjAunNmD/SX39OtV8Yg5AJ/kvWiegxbiGHIoCFrSa8CUu1sGTo+WJurZDEYxeQYhCCt0LzW/2zv5uRhLCvcXxuj/Z3tdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LaPr75fWOvdBgk5NzGOT1ZxS0KLZefh5QA6CT99MCY=;
 b=rrOQ8Jjp2br2Si9q2WxxJGBXHqGJxlVB3BUxQmaMGAp98UUtAOuwB7zLvHui9qskvJ4wSkHLpMMU63ZmC4K+sf0yH4pA4ZmFwjFg2hASpderhTibhJISalSVS+kUGcjL6kN9r4WfzncibVo4OMYrglwUBmSTqdxvfd97Yr2Jdrg=
Received: from CH2PR14CA0007.namprd14.prod.outlook.com (2603:10b6:610:60::17)
 by IA0PR12MB8747.namprd12.prod.outlook.com (2603:10b6:208:48b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 23:32:22 +0000
Received: from CH3PEPF0002457E.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::3e) by CH2PR14CA0007.outlook.office365.com
 (2603:10b6:610:60::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 23:32:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0002457E.mail.protection.outlook.com (10.167.252.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:21 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:21 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:20 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
	kishore Manne <nava.kishore.manne@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 06/15] dt-bindings: firmware: xilinx: Add Versal Gen 2 compatible string
Date: Wed, 18 Nov 2026 15:32:02 -0800
Message-ID: <20261118233211.4121361-7-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457E:EE_|IA0PR12MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0660de-797b-4cf6-30ca-08df45cc31e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|56012099006|11063799006|261021121427099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|10067099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RcfcxhU8R7qwnGdzADQD5D3wlVzSesBluhCv9L5GYT/17JmCwKJWRz2iGKY/ZnlrvfQUISYFn/AzLGVUWib6GmT7hqBR5V0bmQvrhnSIIUV/lTXA2pdOWx+qGbBKJgTXmiVyvFOTBaPHadkBPkF5Ksd+r3PZpNR00dnDhpOwqCxZdWzXtZ+IFCpBnybBE+ks3PADpcCUooE1N5dsL0GqBGkjSdgulOvM1YAFUP4F2E7bm2iD/wIiYmglOhkNuwDszsaN5CQXuYYidwi+6XutJn9fwE4Rppfg/uPkTAUoLzHhNMKZQQNez66QzDwptZhsrjmfjd1CKDXp7JeigjdTyqS16NwbwLbyk6WsDgTUb2pNdWVfZBAWfdzxzZSLDpqsMOBqa6FSfWRQeOwMIQQUkxW1+NYpowax3aWvcqEs9/0n8rsdaXWV+jyi5x/V0z6Y3ztVZYBSBVmj6fPoKLH4pFUrrKE1jA4BQLnEEBZSjbiPlz67J5O3SI+LMpMZencTVYqUD4bx5BBmMkZaU++yUXmx+1jVbYX+85Jbnrsg6O/c0udQf1PDAsBbVM8z4wvQuQyzJtoobYsKsetutWs6mM5lk/c/ng/AoLzbboYbsTZ9Diq7XgZDZ0AU6zyXM9Y0xsI9as64VgsUWx7FGUSH0Et9eIdAy0JoE2b4xIxjZ4OlUQfx2VbOxn021q/nDrB9oTs46vxexNBJujyTh36ktw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(261021121427099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w0MXxEpS2Z8fKd9LDF8LUS929SMbc0WsUXEPPR1lO79WJkYK/IfcnQF36h8YvQW9zX994Ac/BW+gnOx37G69WL16awrr/BbbavBJMQrfSQ3bWrqUv5dDEbMwcYjDDlxJ9R9P1d/PBrf5pHNpkezUt/IVy5AcgaiJxVTvXPn7zcZJc1hLcWM1NFKAA+Hjs2ccQtiD+h1DlezoGemXayJA09vMdf+EIRmP0Z5gu9nwCC5P7boFRBUPFlbSbld1/j0PTT8kKChfcdHBFK8DxBfK03eB47F1kuQUgf5H4E5Y7h2cRBzCPDmK60B0ECXDkBh9uo5PjuWJwHAbY7hX0hp1Av2SnoD/G1dvetJhKZnKtLI8UPQpfSHBPV1MuNDXkjBwu4tVoRJaK/Vh7NnaxH4sfOaozLF2+YC2jIl4xSzorvZUn9yzhPvESQz4bR5rTsKK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:22.1909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0660de-797b-4cf6-30ca-08df45cc31e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0002457E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8747
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153229_350890_EC955F52 
X-CRM114-Status: GOOD (  10.41  )
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

From: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>

Add compatible string for Versal Gen 2 firmware driver.

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index 72af37cdb103..60d1bd329d0e 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -32,6 +32,9 @@ properties:
               - xlnx,versal-net-firmware
           - const: xlnx,versal-firmware
 
+      - description: For implementations complying for Versal Gen 2.
+        const: xlnx,versal2-firmware
+
   method:
     description: |
                  The method of calling the PM-API firmware layer.
-- 
2.34.1


