Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TTcChKZx;
	dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=ZYN/15U0;
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-sharedspace-onmicrosoft-com header.b=CHQtgiW3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lQXDmW5OEsrSsDo6z0Cqpb28j1XuVVBbXnoQXOOZGHQ=; b=TTcChKZx6kTDL49D48EkIXTj1I
	4SMTFy8mYbZ/KihT+AZwCtZe+rHTbrEp8L288CDsqYRga8cbNYN/WKchoTIjGmZrbToL1n6scLSlK
	iwNkuvw3knGKG1RBmhjTPXEZ6X1hyqbpF7BKkYXQ/Z15cukceIH9H1A13fDjbXiSlLhx5jB1oCYC3
	yBz72sz3hMVZPBxn25z3cVuzE8TuLjwfztx2rkGU2CZP1H4g4L4CD2AZGWcxOAntZ8UQrE3TApPPZ
	CIYQEqcxWZ6l5JJb4dMvXu+m+iJ0oSqcxXCfbrw0RhiN3r3XcjVj7AmXhkVrqTj9KX/aIM8mB6Uh/
	0uK6MqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVb5X-00000004u2U-0rE3;
	Mon, 23 Nov 2026 20:56:35 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVb4L-00000004ta4-0P84;
	Mon, 23 Nov 2026 20:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1795467320; x=1827003320;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lQXDmW5OEsrSsDo6z0Cqpb28j1XuVVBbXnoQXOOZGHQ=;
  b=ZYN/15U0sf8xWBE5QttVer0wMGEq8uOHvizVFqn4oapCMePC4w1W5RtG
   t41Vnrw0uKaHsiLJeumkxAtS5xvS3VOss27V0xqLrtJulSWopLqUWlfhp
   QiFGHE2al3cRstBzZ2xjlhRzUa3txHNrUBAx/l6kSe/6blDyW/4ZA8HUi
   Pc2uaf6869ZhUgdNB/rRiVECydhmV5gNWCdLDzwSNfz7Lk//uqi7dX564
   Hvfbgmbiw7Irj6sBrdoYICyLMi9ppkCyc0qARZAubbVbIFTMPmyZMTKFR
   eaVwu4KNhwb0lmkxLEkReF7qlJexTqA9KqXcM4iTm+p+nba+b7P8rJiD4
   w==;
X-CSE-ConnectionGUID: K3fpU0ARR5mQIi22Mz52lA==
X-CSE-MsgGUID: dFFDGk1YSFmVT9kLMwbZPA==
X-IronPort-AV: E=Sophos;i="6.27,229,1786982400"; 
   d="scan'208";a="161515163"
Received: from mail-westusazon11010008.outbound.protection.outlook.com (HELO BYAPR05CU005.outbound.protection.outlook.com) ([52.101.85.8])
  by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2026 04:55:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q57CR3GHtouJMiLX0hCS36dm3GyuE6fy1DHMMujbDt3ksi0q2qnBj3UeHLdE+dOy4l3kqFaHnZx8dWX4ct7EEnU+7VRXFYD8PSObRkvZgjeWK8vlFbH2qbtKY2zXyNDHyAqPfAtMfq3hn9d3iEygcjZThf7jDWG1t/aXkeVmW6qFRC7Q1yw+rINADVkg42Tyc3nrkcrO5hPnbGWb0zfA3I0+Mq+p0wH9IGOS+9LYXE4furFmidazcw9q+kTfigHm2nHxHLdeNVv0zFtykM1d/e5FNjlmMW09nCBGccrAB6SGijU50DjfVAmtm3yDhdPSqLceD2+RF8199vD6OfKZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQXDmW5OEsrSsDo6z0Cqpb28j1XuVVBbXnoQXOOZGHQ=;
 b=eGYdk6gA8HPIOO+Nqe7u23FI28dhW2gVqQpXupDE7yfLLN9YTmTf1IKuYU2b12l/AVzM62V4X8NFZX+4FOauUo1Zej6zqfjF8X19j13bXNlFf8QxIVZbxhxi4G7k8Aiw+okD355fEYYmF1QAQGycJoicfpYjy7lzT7lc2DWRHQFbRvRpuzEUk9Ia6NKPYMEJrquvqo7sKQgX2vVyysOQYRJxFaybmZWepSNOfX0SdgAAZYAlahVbgygpf1dfZFs/gs38txzatTs+zz/7ARZ9QHeVpKfF0Q+/PBJRmCAG8P9QzUyFvPHfeBYCXuIXdVVQJhzl8kCtEbjowZ9hHHfQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQXDmW5OEsrSsDo6z0Cqpb28j1XuVVBbXnoQXOOZGHQ=;
 b=CHQtgiW3duQtU6y0ZS8LaDRQIjgHdiP7E+GNFP86cYXSAhYssZYpLjDIORAHYHjPdzXhrzVD8iT001RJTVtN23/mAxT0ylMeodBn+xyKuaoxzLhVLTUP5fgWp6MmcMN5jNoW+h0qiSRhgs7adYfT5UTE6IMm+Q5YzpqOlsiEvdE=
Received: from IA3PR04MB9680.namprd04.prod.outlook.com (2603:10b6:208:510::12)
 by MW4PR04MB7427.namprd04.prod.outlook.com (2603:10b6:303:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 20:55:17 +0000
Received: from IA3PR04MB9680.namprd04.prod.outlook.com
 ([fe80::380:1453:ea86:e64f]) by IA3PR04MB9680.namprd04.prod.outlook.com
 ([fe80::380:1453:ea86:e64f%7]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:55:16 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "robh@kernel.org" <robh@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"cassel@kernel.org" <cassel@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"heiko@sntech.de" <heiko@sntech.de>
CC: "sebastian.reichel@collabora.com" <sebastian.reichel@collabora.com>,
	"chewi@gentoo.org" <chewi@gentoo.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "shawn.lin@rock-chips.com"
	<shawn.lin@rock-chips.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, "manivannan.sadhasivam@oss.qualcomm.com"
	<manivannan.sadhasivam@oss.qualcomm.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] PCI: dw-rockchip: Clear stale link down interrupt before
 unmasking it
Thread-Topic: [PATCH] PCI: dw-rockchip: Clear stale link down interrupt before
 unmasking it
Thread-Index: AQHde0QP+4p9Ni9olkuYGjVJ0Q9Ozbc8I1iA
Date: Mon, 23 Nov 2026 20:55:16 +0000
Message-ID: <90734dc76b9de4fe7a0c62b5d4e494ea59ef2fe3.camel@wdc.com>
References: <20261123121217.1107902-2-cassel@kernel.org>
In-Reply-To: <20261123121217.1107902-2-cassel@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR04MB9680:EE_|MW4PR04MB7427:EE_
x-ms-office365-filtering-correlation-id: 56e608a6-616a-436c-301d-08df49a413d5
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|11063799006|56012099006|261022075727099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info: j3QJ2sggGvPmZ0XGARGquN/NCSHlW3BD3DwozFdACsVHhddvf33uPvB0DcKHTLdJaM22rN5IkrNegg0EQhib5Aqpoo4zEUtfz807xeHPL22UtppyFCx9BKwTiB0vG3pYB1JiTThUZe/UNUeiuGnhiYGafhunhbLA6qhICk95a5B+hPsq28lPBJjKffq247Dflp+8noO4VbUwoSIkJaPLCUZ+Qg1lXhMH88kb9cXCmDUKsv6ZBuAWsYElH+ChyG+tdDJFtt3xarowMzrwZOocflWWsRH5VxVE7IH/iRrfh5oqZdZS3meOWL71C3SQ+RxuFoPIZFen51/ekNJTg/Y6KfFUXAFgRrAEqfmmDg+L+R80vyiH/HyyiC9vgnAkViu5YI65Qb91CJMBoIAAfVifbkDlgdJPPytV0LjtJ4VdS0F3erWNo9OClXs9lPKbC5znP7wRqRdufKJ8B2p9QKngZZAqyvxyZPFyzz80464n9R2KCqo9QcBWjI1PK7Y8pYhRB+ULvMLztKFn0ewSYaDmksV5UKok2HKiIgQ2xrMwvnZkdNrlMcQb/ft025EfZmgt+vJygIP2gcLLhFKMYVxBk0yLUXkn7M46StsEH285JG+rcTHzMPvNk1rUz7UfpMCpumAJD/YrCYm5BtguOzrTb784O++NjF4rZsS77Cr9jL0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR04MB9680.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(261022075727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXFkK2t5MjN3SG90aGwrWjM2ZlNMZWtFWUZmN2NUR05HUldOSE9rRHcrOGdG?=
 =?utf-8?B?S1psNzA2WktPbWJPVWlJazkxZnd2MmwwRmxtMC9seUl0RlRiTkpjMFk0RzRK?=
 =?utf-8?B?Sjd3ZWRDQ01WRWZDVHd6dmtnLzJ0Q0J6cUdNb3JUcFVwVlV6aGZ5aENMMk1G?=
 =?utf-8?B?b2RLcmN6Vzd4WjFxYlVucXVodVA1LzlPdzdwazcwc2xGYWprSndXYldOdjBW?=
 =?utf-8?B?dFVmK2ZuOFJnallWd2dCSmdpQ0ZaTWNRcE1scnU0RU9mR1YyMUpVUnkvSm13?=
 =?utf-8?B?dHJQMXU3dTJTWFB5Nk1nUlBTb0RHTlgrSVJwM0M5ancxQTFGV2Y1akpueDhC?=
 =?utf-8?B?aUdJWUZzakFGQVVnMXdLY0pDRmI4MmFKZFVWN0JaR3hYcnlpRkk5bmZsd3pa?=
 =?utf-8?B?aGg2UXJNa0w0VHBJdTc1aDFTTFZHSXZxTXQ5WEkvZXkvVE54QVczSVRJK3pH?=
 =?utf-8?B?T1Z6ams3eGVpUVRCMnplLzlIYi94dmMyMDQ5VStRZGpCSzBJUC9vU2k0dkxy?=
 =?utf-8?B?MU9vRFlrRDBNbGtRSENMYkJ0WFpnYVpTM08zQXhyTmJEanBXMVRrK3Fmdzg1?=
 =?utf-8?B?MExlbTJKaDdBWWRmblZoUHpoTjY0bndKSlV6a3JLZmpJcHFmQmVMNmo4cFlu?=
 =?utf-8?B?akdsVEFDY25uRS93SFdjZXErMkkyRVU4YkJKRmRXZWFsYmhSSWxDdjJqd1Vu?=
 =?utf-8?B?U3VnZ2ozZ1RHZkhLRFdjd2xhWHpQaU40eWd4UlltamNYNFByMU92LytkYTU4?=
 =?utf-8?B?UVpPMWxjUVduREdsUkgxTFRuOW8vUEdWSGFHNy84U281SlNtLzcxZkhhV3ov?=
 =?utf-8?B?dUFVMlFtQnN4cTNpbWJNZndWbEZQV1pnYWY3NE1Pc3p6S1hQTU1zZFVaVlRT?=
 =?utf-8?B?L2g5UmY1T3FUZVltaUhCVG5udUdHL3RPSGZLSStIdjFBMzVoY0VRYnc2UTZD?=
 =?utf-8?B?cHJPSzNKTzQxamlVMzNaaHROT2NRdW1Hc24yeFJLcWJ4M2tZaGVwMU5PNXFN?=
 =?utf-8?B?bkNOYUh6eVU0RDd0VGlDaFJET1NHVkkrV09xc1NZL21kRmNhdXpXWWxKTDFI?=
 =?utf-8?B?YTdJRmJrdmNIaW93dS9Lc3VqOFptZmVSdXBkbzBuOVNtMFNRNkQrT1VrbkNi?=
 =?utf-8?B?bUNQQkEvK3k2Rnc5WnZYWVZXeFliR3VNcjRNS1FMMEJvbjcwVUdCYXNTaE1H?=
 =?utf-8?B?eTFUVTB6c1c1bnU5WUYreGNMU2V3NlNIQU5TVHlzbXMvaVBGQU5ORXNjUnVo?=
 =?utf-8?B?emRQd3JEVFpqV1NReGduVFBqb1ZVV1l1SC9uQ0dFWEtFNktmL1puc0ZqN2U1?=
 =?utf-8?B?SFYyeEZmUzNhV2w1dkYzK0J3blVvUHVxUDMvNm51T041L1lnMlNQL3B2Qy9P?=
 =?utf-8?B?NVpzU1ZJYUs3RjZZNGxsSGYyTVVydy8zQWl2NWxRUk11dk1SY0M1YVJzRzNL?=
 =?utf-8?B?ZDZoUkRmNnE5VE4wVjVNaG1LL0pjUkIzUCtpckJsb21rOFduTTBGNjFCK3Fh?=
 =?utf-8?B?NEs3cVI4ZmdUSHBXc0lzaXMrTkUyUitJdU5Pa1lYMFNJODBvMnkwU0EwZ1R3?=
 =?utf-8?B?VGdRM01oVVFpMXZUbXlLVWZWVWZ5dUZmLzdVKzRtNjFsdzNQSlcxTURlMDhV?=
 =?utf-8?B?QlRGZGw3eWtDbjVaSkJ4bU9pY3BTQjhjUll4VmI3bFIzRWtyc29DdzZLd3BH?=
 =?utf-8?B?V0FCTFcrcnN4eWdJNWFrOWZoS0E5VFZ2cUlJRHpzTk1EWFhpL1dQa01FdXJP?=
 =?utf-8?B?K01acWZWNWlVN2hDQXUrSm1NaGNERk0rZW5VbDV0Y2dPcDYvRnlrYnJPeE1J?=
 =?utf-8?B?TjcwVncvL2tqZWlWV1pJb3ozTVpBa2UxQkNXd1RnazZYMkxZdndlb1BvR0NB?=
 =?utf-8?B?Zng1N2tLUUdxSDFhRFZzRkd2TmtsSExNZ2kxY2s2bW9xZjNweHNaSUJ1ZFBk?=
 =?utf-8?B?bXFkVU9WbUMvdkZINzBPVEI5MXMvelZoUklYMnpVOE5IeFl0elRzTU4yc3di?=
 =?utf-8?B?UDVhdW9BbVNaRExYYUlnSklWNmpwOEh2RG1uN3FWN3UzeTlsUlNrNk10RkYv?=
 =?utf-8?B?MzhDUTh4b1BRYjRIUDBVbzRiWVRVeFAvQXliRG1ITFBoemNNMjNtei80dkVz?=
 =?utf-8?B?b2RMaEcvUVc1Y3ZWMm9GcGNVVllPdWVSdngwWnlqWUhNRERLOWo3aDVBdVRr?=
 =?utf-8?B?djMyaG1sQ2U5ZVRRNmFKNy85d0NTaStPM3VqeFd0Z2h5OFhwVFhYUG12Q3Uv?=
 =?utf-8?B?ZDlwSHZsTjhaTFNKNmxLVTE4MFkvQnA0M0Q1NGQ2bm91L1NnbDVYbDZOWHNh?=
 =?utf-8?B?TnZ0Zi93OTFkK2dBNUsyN3d3aHUrd0xNaVM2NzJkWHV5bitaMEhDTjJ2enhV?=
 =?utf-8?Q?S2QEH9IaTfBZVMo8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31767C6FB60DD9439765A2456B5BDDD8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HJKNvGOYRFQfmzy8b6XOQ53egt3kubmnO36r5biZadL1lKx/eawlqsVJkn/MrWsV1pt5kc4TLOXhvo0iyHf6DXS+QSP49fnoKCusME4eanqsQIv2uwe+etn31OKUbJzkw+t7A3Ocln6tdCvfdp6WoV/paGW0lNcW1WOG+TJf5LXEePqwfaFsf900ZwGupF5WmNVwc3Y/6QKPgvP6iw1Mq9KmBEaYSF3X8BD8hbvSq6R3Do/x6+0bgt/c6cw/l4/cyeO3Sj/9hg7ZB5A7Jni3aUbSyYLzVd6x6qsdzUZkpoCmcqM44wBrUse7mS+b0+Nkoo4i5sh3+ripHo0nWODaAA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hih5OcVPC5FFGdGoL79HCywAAXlEAO/eVGsv2SablA60Kqufoep92aLTVVV4JNzZjjq7VjtnMjI3YRB42KAnD5WkAQLWNYDHx629JOFd7KUgJrN8xcAkfyXPOUc4K777kYUmVUc6MlbMEIy88ESlQ00xzlSdc4hn1plPSvRzUap1DmxuPgMBfLG2ZlSCmWOLqr+CC66vds3pE1qynxERHjoBMcJXN4mbmk+9WPxci59znH5gb6mW/ZJLov9xriUl8g12tPrI1b3PmgoeLCV7ZtU7b/8N8dSrJV6Vtmy4v5XTQ9FtiWiD4RabINURguBJtKe//EAa+BHYYVGwIcF95YqA/D4azZajZ7oCbEevlGLCtbcw5yoL9+y8MN5v56ZOBRkYLQVw52j6R03Wg7LeJuZYMMJmqdphOxB1GnXDPjkb7yhs5jkU8HwqY401I3jUIN9ZRSMoFpYFPC+8PCdY7Stl2x/Ji4n5EUPCF1u+hDMsPI3v4qHuhcsZOMmCURSdIzDvDi1GB/AYJlJQuY8CTg7qeiu0Z2MX00CHUfONvtHFTN3itSTtgFuMM/zparOn7fLvp8YXar29k6R7gFFnYQgTsvP5Xj/qkF4OsM+CD1YZHhisgVZFwyqhd+omfG7o
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR04MB9680.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e608a6-616a-436c-301d-08df49a413d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 20:55:16.6017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Y8FOGlF48ds99Gut+Re/JLBhYUIaaM9ZP9YGRieCEia4yplYt8C0cq/Ke6jVMwx9RJooB/neLI7fAciprHt5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7427
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_125521_203738_AD4CA459 
X-CRM114-Status: GOOD (  17.59  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCAyMDI2LTExLTIzIGF0IDEzOjEyICswMTAwLCBOaWtsYXMgQ2Fzc2VsIHdyb3RlOg0K
PiBQQ0lFX0xJTktfUkVRX1JTVF9OT1RfSU5UIGlzIHNldCBieSBzbWxoX3JlcV9yc3Rfbm90LCB3
aGljaCBhY2NvcmRpbmcNCj4gdG8NCj4gdGhlIFJLMzU2OCBUUk0gImlzIGFzc2VydGVkIGFmdGVy
IHBvd2VyLW9uIHJlc2V0IHVudGlsIGZpcnN0IGxpbmsNCj4gdXAiLg0KPiBUaGUgYml0IGlzIHRo
dXMgYWxyZWFkeSBwZW5kaW5nIHdoZW4gdGhlIGRyaXZlciB1bm1hc2tzIHRoZSBpbnRlcnJ1cHQN
Cj4gYWZ0ZXIgcmVzZXR0aW5nIHRoZSBjb250cm9sbGVyLCBib3RoIGluIHByb2JlIGFuZCBpbg0K
PiAucmVzZXRfcm9vdF9wb3J0KCksDQo+IHNvIHRoZSBpbnRlcnJ1cHQgZmlyZXMgYXMgc29vbiBh
cyBpdCBpcyB1bm1hc2tlZCwgZXZlbiB0aG91Z2ggdGhlDQo+IGxpbmsNCj4gaXMgdXAuIFNpbmNl
IGVhY2ggcmVjb3ZlcnkgcmVzZXRzIHRoZSBjb250cm9sbGVyIGFnYWluLCB0aGlzIHJlc3VsdHMN
Cj4gaW4NCj4gYW4gZW5kbGVzcyBsb29wLCBhcyBzZWVuIG9uIGEgUXVhcnR6NjQgTW9kZWwgQiAo
UkszNTY2KToNCj4gDQo+IMKgIHBjaWVwb3J0IDAwMDA6MDA6MDAuMDogUmVjb3ZlcmluZyBSb290
IFBvcnQgZHVlIHRvIExpbmsgRG93bg0KPiDCoCBwY2llcG9ydCAwMDAwOjAwOjAwLjA6IFJvb3Qg
UG9ydCBoYXMgYmVlbiByZXNldA0KPiDCoCBwY2llcG9ydCAwMDAwOjAwOjAwLjA6IEFFUjogZGV2
aWNlIHJlY292ZXJ5IHN1Y2Nlc3NmdWwNCj4gwqAgcGNpZXBvcnQgMDAwMDowMDowMC4wOiBSZWNv
dmVyaW5nIFJvb3QgUG9ydCBkdWUgdG8gTGluayBEb3duDQo+IA0KPiBDbGVhciB0aGUgYml0IGJl
Zm9yZSB1bm1hc2tpbmcgdGhlIGludGVycnVwdCwgYW5kIGluDQo+IC5yZXNldF9yb290X3BvcnQo
KQ0KPiBvbmx5IHVubWFzayBpdCBvbmNlIHRoZSBsaW5rIGlzIGJhY2sgdXAsIGxpa2UgaW4gcHJv
YmUuIEFsc28ga2VlcCB0aGUNCj4gaW50ZXJydXB0IG1hc2tlZCB3aGlsZSAucmVzZXRfcm9vdF9w
b3J0KCkgcmVzZXRzIHRoZSBjb250cm9sbGVyLCBzbw0KPiB0aGUNCj4gbGluayBkb3duIGNhdXNl
ZCBieSB0aGUgcmVzZXQgaXRzZWxmIGlzIG5vdCByZXBvcnRlZC4NCj4gDQo+IEZpeGVzOiBiMzc2
YjNmZjljYjAgKCJQQ0k6IGR3LXJvY2tjaGlwOiBJbXBsZW1lbnQgLnJlc2V0X3Jvb3RfcG9ydCgp
DQo+IGFuZCB1c2UgZm9yIGxpbmsgZG93biIpDQo+IFJlcG9ydGVkLWJ5OiBKYW1lcyBMZSBDdWly
b3QgPGNoZXdpQGdlbnRvby5vcmc+DQo+IENsb3NlczoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcGNpLzA4Y2M5NmM1MTcxZmM5NjliMDc0MzcxNjkyZTZkOTVkNDZlYmE2MGIuY2Ft
ZWxAZ2VudG9vLm9yZy8NCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9m
Zi1ieTogTmlrbGFzIENhc3NlbCA8Y2Fzc2VsQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiANCg0KTG9v
a3MgZ29vZCwgdGhhbmtzIQ0KDQpSZXZpZXdlZC1ieTogV2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVk
Lm1hbGxhd2FAd2RjLmNvbT4NCg==

