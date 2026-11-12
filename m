Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FD3606A884
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=elElmOpQ;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=MuUlsnpW;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JQf1cMoE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GVlH6X2Hea6ZpzeyqDmKtd1k4M6Wtm252My37qsg6fc=; b=elElmOpQdxlpEbTHfzSDiaLErn
	j52Ep5F/MS/w7hi1zx55elGVEgTYzxFi7YPezGng88jZ2LHiXCHkKFIs6hnqlEj+BLkO8L082SCZx
	YemgPlK4qnTMdFZPiER0/PU97SY3/Pl/tXkPjaAPQn+TvoW3PDNnYLEGVbZlJr9BVk34l9Dt0BhHY
	8Px1HwaKiq2tQLJkxrXvjDkjtVR+3W6nXMRVprelsr51A7r3MhEKZW89gXk9FGWd9YaD1CzO+sseG
	/lnm5d2iCRPbOE0ucy1iveQG6AAr0fC/M/3nJ2FaY5T6rEZAWvkFYoCl6l0VLF7bcVtj01QSDnnlH
	KnRWLiWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPuj-000000092hN-1mU3;
	Thu, 12 Nov 2026 08:12:09 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPuT-000000092be-2sO0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:12:07 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AC7uDft3094955;
	Thu, 12 Nov 2026 02:11:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GVlH6X2Hea6ZpzeyqDmKtd1k4M6Wtm252My37qsg6
	fc=; b=MuUlsnpW6ZlBNeX8+sWzbXqOcYPow5+DGuoY6BvW2SvptzKQ+Dqq+xve6
	YH6L7XsS9TgjUi/Mev2tK5WJFRI3GRrX8Gbj5RrmawhYMnN1+96i90aq68b7/smg
	a/j7FWnMscUTJwToGN7WyLQTU2CnwbeMlD/VA+2BI7EdsMXFZ2ECTxFlAO3ClYPe
	MS2su0kxa6G411hGbQhwrAjrE96IgnkSqQQ2AKp6QVbd/8Y5PAMeBS7FlybXZOR5
	3D8CdUGLGLUxBldPJvk+iGot24a317mxUcQ0HYw/Ym9NQ0UtwqLxrl4U8Ze8z3t+
	sjFDiUkUWwIJEdSpZ0i8j96CBeDRQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hw4cy1v6x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 02:11:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSyNcJADrINqnWYnCWgoNLlXbMnjQQ6RuT+aS+U3ow2eX2EBAnZ/eAB5x3NCXIY/q5bJcyErHb7UizKEd9g15PY3L/aAGXISLGrdMQAZmkQmmn6mJWpn0rjBU2nnuRxrrxOsADj3EI2R0q2DfpkRPCYSzd9bZDdi9ZB0Tg4OUSyCPPfWPw+orjg6nTUKyFQmFuyB06SzLrkz+5gqU/iZZg2Bp+j4IEyio9okLw+/aRPBWqlC29Q3m5rla0ZgvsCsRrKAbrFKA1ANlU3cGo7IgXl4n+BnKYIGUBRY4wy7xwb5KlcoQR4rQkBQStH3cMKps6HRjx4vnhNdcwDE8OD3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVlH6X2Hea6ZpzeyqDmKtd1k4M6Wtm252My37qsg6fc=;
 b=rMExUtyrMVKZiVkvt1T0O23OAECYLjIZub0i+lcqMJJZjTfaatI2MfjJ00KkFFSkoxArNwn2lJvVsxvnyqpwK660byxukIUnc8yNRNUH6X7hZl/KxgzDtYkYORjTPdVKlGCtV2odrtPUDv/vQLlB1f6kUtI/f2HQbrlIJ9HeTjcvBPzVvNzYiefWtzhrZHhG5dsjteHW9tTKg++tZoi/f8x8xdKoDAXjYPKjkOLmJfqt4xe3jjOKqfwXoV9qEdmO94EufX1oF7Ja1MSO6xRKlJX/Ulc/c8vSk1VMyryWvxMyzUR0+LVBFxBN162BUJ3FDOkzi3B657W5qh5Z7nx4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVlH6X2Hea6ZpzeyqDmKtd1k4M6Wtm252My37qsg6fc=;
 b=JQf1cMoEyAycIQ0XZiNbBvzShDoYniWtrNpVzZ1sVsdZRMG5d20SvodaY/j7zs5AQQlFDgs9GScf1l/hJz+8SAK2ukpRPk7waL9iatskIInnhtZNoRp0aoBEe6so8fLoio6hJeWQsLDrPD/T7RhkFz2uxpRy/qavbeoUV/wlDhI=
Received: from CH2PR15CA0026.namprd15.prod.outlook.com (2603:10b6:610:51::36)
 by DS7PR10MB5199.namprd10.prod.outlook.com (2603:10b6:5:3aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 08:11:47 +0000
Received: from CH2PEPF000166C4.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::82) by CH2PR15CA0026.outlook.office365.com
 (2603:10b6:610:51::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 08:11:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF000166C4.mail.protection.outlook.com (10.167.244.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:11:45 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:11:05 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:11:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 02:11:04 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC8AlaM1453305;
	Thu, 12 Nov 2026 02:10:59 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 2/4] soc: ti: k3-socinfo: Use device managed allocations and unregistration
Date: Thu, 12 Nov 2026 13:40:45 +0530
Message-ID: <20261112081047.1550471-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112081047.1550471-1-m-shah@ti.com>
References: <20261112081047.1550471-1-m-shah@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C4:EE_|DS7PR10MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: a648f3df-0a20-42fe-db83-08df409497ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|261009221227099003|261009223027099003|56012099006|261021121427099003|261102123227099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: +ofWpa4ZC3jfjNlUhjoPqXN4ayPKAk6f4EvPGGZPZnilZo1rcpkyBQMY6tnFCGya9GU1tIb/P5tyY1ncEzOi/zA9gWrmKRHhhP8OO2olXbXpZXjBbX6kR4vMQI+SuVewjQxICWRf0vv96c5rtPGBKfjeZs/xBNqnvOfk0CIxfKpl8kVh4pfKsPmw+MsNAvfp+k8K2SFpBxOEVzmS1gsUCogdGkds+g8yy2IoXWBFhraYuTtOotGXecBhaQXrEaEd5ZbxhKvsLhTAFq7YC/bvdfVz2j2V7BHVWo/FYEXKlKnmHLGzbu+CvN7PQTLn7UsskAiAF4qY6qnQFrB/sXP2TQrP/qxbmllI3oGtJ87OuWEqX8mCPXb/CdYJC4dia5s/NmwynR/YMjIoLG4S0oS2Mg6BgtjLYvbvAsD0JrvUHBygoJL/xfvzyeek1tLjmkomjr5bC2IwX7PshM5TodUU9rqhbJqC+w5jSx4gOXtQrJUSPnS4XHdbACO5LHkWlHoh3PSdudMcHQTyevgqb3L4Io8mxks4odnLTE6eqE9HIjfhnl+VFM4f+NrzV8wO4/81a8NVB/ulAcWsd/rtT0Fz4OTJbsL10iROa7ztpp1PaWSRfkgnXwoPkYBCmOX73lzyXa0qZqugvUHOLWQE3KP5tYiQ7NHWgaz9oZcMILfVElnkpLKqicdpgWmoCt2nWu0zJGKP0WgLYInrSIBkHc1GOA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(261009221227099003)(261009223027099003)(56012099006)(261021121427099003)(261102123227099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sz5xIB5es2fDYQAzTzmZFN16gEmZWnWfN6UF84ETpHaWCIVL2NIkt2GXz8zQ0uoIC0Q+9oMVkd7l17JaFP7F7ODcG4j8OOc8FRY5ngvyj0YUZ9lyU6FZYaDRGzw4sbQ0E+CW5qSFL2BTNq9608ujRhQ3cOF/TU/+e+Txa5JagHW/f+VrRVKeD/GGu87ElKKUEFRMJV7CPA2N0zsOaLfWQCrzgdaBvcxi3UvrOn55cWuEhhDRAoXuoIwoVrknG1WSE9AHl6cBsDReqqeGUmFuGUbVl12ozjuOHPuX3eGTdPxMVL240MnOqPSBundXIEVG5nbMXLO6CNMdbUKfs9MgPqEUb35l51e//T9YDMrfeC94eGOhbtNc/bpiVDELGT6ltCe7H9ohR1FPgRmlnD83LUWFohQmZBzzbx3En6IRObE3UG0WY/EAAfCriHiffj42
X-Exchange-RoutingPolicyChecked: fzIK7f5kKUU8OJ/QOVLFj0Z5tOGb/k9iiJ+csbCpkLfqtgRo1iEHqFGpJdBFL/lwzB5S3nQ9ASF8rTmAwXnCIg+cWRj9vLyIuaumPMoUUDdO0yDDeTm0VokAdNyoWobK9cLJD84wY6JDYVACAwsPYkCt3Xx0UING5VKGz+aUdCnF5zhBE5GXNGbTXnIFpmqbhBetMEHuYBB8z8npYw+jC6FqPAxXql40pH54dNf+O1gAE42e4CgRnh2oOWadagTIzOmbPq2S4K1eOhPGLYkCT7MD2ruOb2T6nF62KHP9xnp02swCSsRoXzGo1EqrGQ28CDqkdWswibSi9fl01b/PsQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:11:45.5029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a648f3df-0a20-42fe-db83-08df409497ca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5199
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfXx2g/nWDY0VtI
 VwAORQZ6xVYoVoplDR/584uB+SiWh+odqts5ja0KEvY4+Q8utXoz7Ds8+bgDDFGt4QVt4dmkmgW
 ERl1Q91ZS/m71kbUwvBJ1MB3Cnos1VU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX6SS869h8tuYc
 sscEmHnKKRQC12riwGz1kRDWv01xSOgs1M9af0icT21b4GRB1sJa/lg26/2my4Hz+uri1WS3hzj
 QovcvIHX4w+4ZMB0jborbaylqzo05Tm+Fq5Yf94nenXmW0XaY2jWRKSkA+CnZe7QBdPJEslzv+3
 3OD5aJHKbsVub25zDrVjs//9xhrtqn4nwqv8HiOpYoyHIOlFp4oOmWcX42+zg7IAHo5O1LHlROR
 F5Ebk2IMxa72vpbru5kDHEdCrhuNoqCNrIJSx0ikmT9xdBiXvxv/56MQtVoBH7RafVb5pkmedGe
 kFFbYXzLsEAOSLfBKEq3FtoY67qdm3lu/WjiH6Nl9aLTacGrcigYio/5Q8XmjagvHwaWABSn1Mu
 U3/SjlVJ98+2t3B62ywCKNINGVVUaBzYyR0wryNI3yC4QTLlQn5HM+b6tHcJcXMitzDPEcgduC6
 ZvQKqvx0yC0yS72AkHQ==
X-Proofpoint-ORIG-GUID: k0cfPgoYpiCXEUSwMCNRNx4FIgjcaaVX
X-Proofpoint-GUID: k0cfPgoYpiCXEUSwMCNRNx4FIgjcaaVX
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6af574c7 cx=c_pps
 a=eZaJmiuXqmfvnt2b4sL4XQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=oI1EYUqv383xVCJDVaIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_001156_236693_A749FA1F 
X-CRM114-Status: GOOD (  15.21  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allocate the SoC attributes and revision string with devm and unregister
the SoC device through a devm action. This drops the manual error unwinding
in k3_chipinfo_probe().

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 drivers/soc/ti/k3-socinfo.c | 43 +++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 48dbef3acceb4..e21a2cd14c811 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -115,14 +115,14 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 	case JTAG_ID_PARTNO_J721E:
 		if (variant >= ARRAY_SIZE(j721e_rev_string_map))
 			goto err_unknown_variant;
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
-						   j721e_rev_string_map[variant]);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
+							j721e_rev_string_map[variant]);
 		break;
 	case JTAG_ID_PARTNO_AM62LX:
 		if (variant >= ARRAY_SIZE(am62lx_rev_string_map))
 			goto err_unknown_variant;
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
-						   am62lx_rev_string_map[variant]);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
+							am62lx_rev_string_map[variant]);
 		break;
 	case JTAG_ID_PARTNO_AM62PX:
 		/* Check GP_SW1 for silicon revision */
@@ -134,13 +134,13 @@ k3_chipinfo_variant_to_sr(struct device *dev, unsigned int partno,
 				 gpsw_variant);
 			gpsw_variant = 0;
 		}
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
-						   am62p_gpsw_rev_string_map[gpsw_variant]);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%s",
+							am62p_gpsw_rev_string_map[gpsw_variant]);
 		break;
 	default:
 		variant++;
-		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
-						   variant);
+		soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "SR%x.0",
+							variant);
 	}
 
 	if (!soc_dev_attr->revision)
@@ -158,6 +158,11 @@ static const struct regmap_config k3_chipinfo_regmap_cfg = {
 	.reg_stride = 4,
 };
 
+static void k3_chipinfo_unregister(void *data)
+{
+	soc_device_unregister(data);
+}
+
 static int k3_chipinfo_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -198,20 +203,20 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	partno_id = (jtag_id & CTRLMMR_WKUP_JTAGID_PARTNO_MASK) >>
 		 CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT;
 
-	soc_dev_attr = kzalloc_obj(*soc_dev_attr);
+	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
 	ret = k3_chipinfo_partno_to_names(partno_id, soc_dev_attr);
 	if (ret) {
 		dev_err(dev, "Unknown SoC JTAGID[0x%08X]: %d\n", jtag_id, ret);
-		goto err;
+		return ret;
 	}
 
 	ret = k3_chipinfo_variant_to_sr(dev, partno_id, variant, soc_dev_attr);
 	if (ret) {
 		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
-		goto err;
+		return ret;
 	}
 
 	node = of_find_node_by_path("/");
@@ -219,22 +224,18 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	of_node_put(node);
 
 	soc_dev = soc_device_register(soc_dev_attr);
-	if (IS_ERR(soc_dev)) {
-		ret = PTR_ERR(soc_dev);
-		goto err_free_rev;
-	}
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	ret = devm_add_action_or_reset(dev, k3_chipinfo_unregister, soc_dev);
+	if (ret)
+		return ret;
 
 	dev_info(dev, "Family:%s rev:%s JTAGID[0x%08x] Detected\n",
 		 soc_dev_attr->family,
 		 soc_dev_attr->revision, jtag_id);
 
 	return 0;
-
-err_free_rev:
-	kfree(soc_dev_attr->revision);
-err:
-	kfree(soc_dev_attr);
-	return ret;
 }
 
 static const struct of_device_id k3_chipinfo_of_match[] = {
-- 
2.34.1


