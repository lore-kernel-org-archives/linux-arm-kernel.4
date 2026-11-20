Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9299606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GMhiRyI2;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Sq8HoMfT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j5Ce4d8nCM+piZH9frIPw21eODt2zq4vwjw4r8+6bNI=; b=GMhiRyI2JBhc15giEhJavtSBq3
	sXeJzCU462Qz86Jhh9y3aAqPKgTIkTXUZW6bXnNPf06v7MptLD12s2jye88PMFeu+ovnvTjya2ti2
	1J8+RrFHeGY8ROPaFq3nKV7Oibwgv1a7sBAC7YtB2oQe4KcVU0oHsMLw07q0InLrt8EEY+h3j126N
	spdhaz7b9BxDVDvWlBUwYNxnCPyLB+MoOE1ZBlmVionzhuLL6rnGKBxTq7Bj3Y3Q4ryJrDaKrdBNs
	V2ZGv38GbVQBVTEBTceTMlQlSZZ1xTB8EGoGHcSlQwWL7wCbJsf+kiEPM3eVaY0XUY95EckexL82D
	NEQxtz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULpS-0000000EatL-1Fc6;
	Fri, 20 Nov 2026 10:26:50 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULpP-0000000Eat0-2k56
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:26:48 +0000
Received: from localhost (unknown [IPv6:2a0a:edc0:0:701:a74f:3cb8:3e85:d062])
	(Authenticated sender: fdi@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C42CC202348;
	Fri, 20 Nov 2026 11:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795170405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5Ce4d8nCM+piZH9frIPw21eODt2zq4vwjw4r8+6bNI=;
	b=Sq8HoMfT3XG0l9P0SmFcK67og1lgWqB7xLO4i0HzF0IY52ob9ogJUIiy1qkldCkwa4dyKH
	VcCPaHOkK2F1BKwNBh4+qLBVi8zmUGdgjKpgAhBYWFn0UfzUABfA+j68Ur71So4XVdTany
	8yZX//j7LOT9oP1MSFEV7o9Li1zU099henMckecZ1/jldwbS2dkp/rc3Iv7+rRu+hvCvVH
	M7HXArO0aOqeSzT0QJ8KVE7vx/Y2hoc29IZq96YisrohSVcikR8FPoqEuVaKv0VT/e4iiM
	zF3ia5Ch8ws2ACOESEQSDR2zABWJnoJTEm0a7KNegid8B5z1BqqyqC9V+2HZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795170405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5Ce4d8nCM+piZH9frIPw21eODt2zq4vwjw4r8+6bNI=;
	b=K7PVPwC4xprzdbghWsTfZ1WVXXRuduZaUC37obVf/2++llZk6rbmRD2K0usWXErezQuFBU
	B85b3L+E6xGvXVJi5IT0cp7Gkb/HOLqXKdiCd7x3iFKBlzm7XNfcRo6uQ091gE6Nn7BNk7
	eugQp1YXVsy4KTnvoJLCAtyei2nKdwwLvdTB5PDNSG9TRl7fT0OcxsUj/yFQS3V+JHl8yz
	7z179y/47AFc2OXmesm3DBk28QlS638Q01RkyQIRSoL4jJaEMqbUFSdhI8kHuMWEihvaa7
	WPJbxRlvc06M41uXp15I/Z61tsIFv5F2jRiliwnEeieNMPaAb0bP6wMqQ2GZpg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795170405; a=rsa-sha256;
	cv=none;
	b=PgJ/LQn5mrtT/eudvsFQ1hZF3AHyTkNwSc/5HTY17o79eY6QEcTZkDp17d6M28UF8J+xQ4
	n8fR2FqpSB9TRMgP15nqLUqQlKsyR7hlo0cjdMZjAnPCQe+pZtGtyMqbTR1wWRGCXs1/aw
	ptLAcCKxR90yPakgY0uTVq7XPuO1P8lwMHbnbkUHd8fWDVID547a4p3bwvsZfkx2qifIRo
	7LAF98iXd4vu8YM9jLXx98sgXiQT9M6i2dTJyLcqoBmgP3pSAz2vHngZG0mCGiuW2SxOhQ
	8VPOsr/0piTmL5/UjAfAQqhsVQHa6sswfKOTiRVDrTs9ySUBxOO8vKJhazxPzQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=fdi@pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
From: Freimut Diener <f.diener@pengutronix.de>
To: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>, Justin
 Jiang <justin.jiang@nxp.com>
Subject: RE: [PATCH 1/5] arm64: dts: freescale: imx93-11x11-frdm: Enable I2C
 level shifter
In-Reply-To: <MRWPR04MB12117B415189A3EC52A69934E94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
References: <20261120-imx93-frdm-fixes-v1-0-78dde22a56fe@pengutronix.de>
 <20261120-imx93-frdm-fixes-v1-1-78dde22a56fe@pengutronix.de>
 <MRWPR04MB12117B415189A3EC52A69934E94782@MRWPR04MB12117.eurprd04.prod.outlook.com>
Date: Fri, 20 Nov 2026 11:26:45 +0100
Message-ID: <87cxrzbxy2.fsf@theta.mail-host-address-is-not-set>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_022647_842679_D706D450 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Joseph Guo (OSS)" <qijian.guo@oss.nxp.com> writes:

>> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
>> @@ -49,6 +49,12 @@ pcal6408: gpio@20 {
>>         };
>>  };
>>
>> +&lpi2c2 {
>> +       pmic@25 {
>> +               nxp,i2c-lt-enable;
>> +       };
>> +};
> [...]
> Can you please move this into imx93-11x11-frdm-common.dtsi?

I don't have access to the i.MX93 Wireless FRDM board.
Are its schematics publicly available?

Have you verified that the I2C level shifter is also present on
the Wireless variant?

I'll move the property into the common .dtsi in v2.

Best,
Freimut

