Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yR0MiJYc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=get9ljy+UfLeTYxtFfA5K653EnMiLg25/XGdzuB6N6Q=; b=yR0MiJYcqVDB39gsyI1QXzCpvd
	mOzyXrNx8n6HF6VlzSLa3rGSmR5w7Wr4QlYZl1VUUlO0MYGi6udoiKO14RShZlkcffwoYMc5H5j4Z
	/nKzsb6iWI5S6EFGeVHdx/KXt5svvoeX6jdxVAeWfuK6BjQNjqbH8MARDvTRgNELQ3mhhFvLIQNHi
	1mPXMWeql3IuqayMy/n1a9Rr86rwWuba2t5qKn2JAibtDUWMwRyRBQirAdPCWnSXVxVoCgoY6zdDk
	P+7OxLJmnut5x5vrbXLZgmaKtkpJTabxVuiEJOkGsDX+h+QYH+Z+GU0MwPOmFaMSPGUDpCrKyD4de
	J9sqD+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEnu-0000000H6TX-1NKo;
	Mon, 09 Nov 2026 02:08:14 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEnr-0000000H6T0-0Uux
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:08:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVlnhv54xzclJQURjS3peZpYc5+b/aLFECQN/jCp4oISNuKWOPsArB3LzgcD2Amzv23gppSCppNIivb+ur3NS1n8dQvQETvBXLbTu4lPiDfL7g+i/1JVDSlnrHdb8mcXMzxC6TLE/+LAerrmoyCMSgixzqA4xSNtSFCfgL671fgjBvEaOCCoqqTUMdyk0xmxLey7+Uq8z8h872wRu4Z1iswiX8N7iBRZdfcHAmyzn6kyvCz7/Gdp8NE38Bl5kP7IbAxjlPODiwi+r15Iewl/iNwU8yrXwXSjXdZ0vKkQ1/Wr/YA0fuIoBKqIFonU6b1auyjAJQkENknrURaqE2VjaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=get9ljy+UfLeTYxtFfA5K653EnMiLg25/XGdzuB6N6Q=;
 b=vWbYoVpkCAakQYa/EBRIlj4UQuPb97HQmUidAQFYlVs63myQoJ5swNc8zpKi/AJk2xDFoUQI9LV78oKZXnmoPtleEraZ5c/3I7zIgwKuuTphOEAFoL51spHdgLSEg8+mvbeuFC8a0J0UlyWpF0UeIoMDkybnWcaIeuqd8XSwkVzCkVgzaRKgdHe3mxZwrW70Exw6jNYADsE9q1vaj30OXHRiugczFxWiRJBYVWlvKqbgzaW0qQG6ZcWKivhnZihoczxHRH3zUHKfHwjc/D3ugWN2fGnlcSieS1jvhI6BhIuIXIK18nJeDGOlG5sNf8x1DAl44nuwiH+7vkXWkKyh4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0153.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c1::9)
 by TY0PR06MB5428.apcprd06.prod.outlook.com (2603:1096:400:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.6; Mon, 9 Nov 2026
 02:08:00 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:101:2c1:cafe::5e) by SE2P216CA0153.outlook.office365.com
 (2603:1096:101:2c1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 02:08:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 02:08:00 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 498C74102E61;
	Mon,  9 Nov 2026 10:07:59 +0800 (CST)
Date: Mon, 9 Nov 2026 10:07:58 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 4/4] arm64: dts: cix: add RTS5453 PD controllers to Orion
 O6
Message-ID: <avEq_ngShxlvFSbS@gary-System-Product-Name>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
 <20261107011012.3655873-5-gary.yang@cixtech.com>
 <65af581e-caac-430a-88b1-3b7425c5209e@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65af581e-caac-430a-88b1-3b7425c5209e@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|TY0PR06MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bed19be-9232-4f0b-eed6-08df3e0647c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|1800799024|82310400026|4143699003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: aApyjdlYxx+w0NF/Wj269Haomxp6Ah/RuCzIcrQwsgv/zvE3l0EnBNJx1Rsllle2CWYqGQ3DY8yushgQbn7Nh93efV/e4rHbjBcgj+JQCriJmIlDATjba/HRF91fzmMqlJmWh6FJqFlI0auv/RED85AqB51JsJWPPpej9Uec1sNsI7PXQ1Ib1TolXGjSv6pDee6IsqqVgV3x0ZhB5jRuMNeAfb5ZYVPSk40+M5N6VrMs/pM7Rz2emwIFtEJG558ThLp8qAvlKWZDmxIetiEJANmtsEoxFdvNI1cUFzmcr09Z08ymwv9n77S/DaCrPXwafpdaYxX1YdQsCVRA2Dz9W5rTzVS78PD0WFZZRMWQ82eYb5B6Z+3J9jqrsmrPzSkFRFYm+vnGIeE3r2XBxgk6QQpttW7XYEEgGfRVqapX+etloSMKXFYZMJ3GgIsuuE19zkwEYIArIDd/ErKcf+tpNKdpS3khyGZTVVvs3oOQ+Zw8aUCHZJO+bXP9RvAPEcnoyHHYoLOpdu6fTnRdMn8tO1uwl6liB4rvVtcQ7QUKq4CN/DFtMgrtQvZ9iiehmr96UW6WF6Z3YjoNAwmZhSLsd05ytR6QOL1KPUPwmtWrJfFRMDMnW/S8wshTygGgnuQPhSyQ8aaJqryNQ1FXsuDkIMYYuKtxhLhbovRZOKjm2hlh7KpOrvB9LzzMEycaUiJA
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(1800799024)(82310400026)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FAgghdDsfqbUMu6ATlLEBYTh2e/E9bho5XTpx7MNcDwwAufvyZVFA+dIoNFtsnd0KCcVVsdRjhcN5R4BF6geF5PFsX8nrH3EoGufWydgrL6BVLHZHkRaIOKquy7k5vjFa2toicSz2GKm/VTMoAbP1CW7ccFIThk2JplIEe05+uRURdsgEW99G0dvbMvZm1+feaY4OEjzOJ56ddT3/vICUmcRzL9M1h06pErIrkLBT3TsJMjCt0Xzb1t3wfXZy6Ri05hyKpBcO6NtyDmKgaSpUEnV5S76RAk92fXowkzaftpZY0b+3L8MXjuvnrwneR0vD45GQUuIO0A69NoZ5uWIO26AimsBBNqdqct/gZRE5bs2nXaUmmA/rAJc/XGhXI7LXVhAglAO5eVhRf74npJeSvx3CiguFbHTldUcheJ85asM2ZjBYisq3ofJk5eO0Xs2
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 02:08:00.2028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bed19be-9232-4f0b-eed6-08df3e0647c0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_180811_158479_A2FDD1E5 
X-CRM114-Status: GOOD (  20.50  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hi Krzysztof:

Thanks for your comments!

On 2026-11-07 11:53, Krzysztof Kozlowski wrote:

> EXTERNAL EMAIL
> 
> On 07/11/2026 02:10, Gary Yang wrote:
> > Describe the two Realtek RTS5453H port controllers on the Orion O6
> > I2C1 bus and add the I2C1 pin configuration.
> >
> > The controllers route orientation and DisplayPort mode changes
> > through the USB/DP combo PHY lane switches, but that PHY support is
> > not upstream yet, so the connector graph endpoints are left out for
> > now. The Type-C ports are still registered and reported, only the
> > lane switching is deferred until the PHY nodes are available.
> >
> > Both controllers report through the same level-triggered interrupt
> > line, which the driver handles with a shared interrupt. The I2C bus
> > runs at 100 kHz because the RTS5453H I2C interface does not support
> > higher rates.
> >
> > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > ---
> >  arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 51 +++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
> 

Do you mean the driver does not depend on DTS? Previously, it was acceptable
to put the DTS at the end of a patchset or place the DTS in a separate patchset. 
That’s why I put the DTS at the end of the patchset. Has the rule changed now?

Best Regards,
Gary
> 
> Best regards,
> Krzysztof

