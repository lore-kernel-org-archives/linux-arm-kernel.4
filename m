Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B6A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y38nhRle;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=bQhzdxgG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Nw1PUI/8+Dw+uE9Ar24vLwu5Jkm9NnRZmkT/cfK/VY=; b=y38nhRleVwpMbe
	qbvOSMU2OhhNQ0xdvfagxF0Ne/437Zlaw2cW2sPN8HWQL0fSoi/qHEclXCXWCHXDX266nnI7j74iL
	SGep/lVvmyLTffxMXZnzytdShlHFsZkFnbxFuuqsIWHCo3qNOTUyMYUsJuyqM94amGbWejp0PzEBr
	72ZxZ5Dxoy2OGf3VXIsLGYDs9W+uwOzhByoqW7J8eP9+vtgFuMczTAb8XK33TvhJwOkLCzcB7VPrb
	rmUbxBy6GwXacrZW+fsd4sDED8tYJWs4dyUZHZV6CC0OhEBPjokX+DI5bPGZBKjNb7XCpB8EhXTvq
	MCbpgA8kk4QwTVaq5tuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNRm-0000000BfGS-0UEL;
	Thu, 26 Nov 2026 00:34:46 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNRj-0000000BfFw-3KWe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:34:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 230B9108AA8;
	Thu, 26 Nov 2026 01:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795653271;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5Nw1PUI/8+Dw+uE9Ar24vLwu5Jkm9NnRZmkT/cfK/VY=;
	b=bQhzdxgGhksJwhez1cJ6RJfzVetdIlhj0vPwN9rwGVYBtPNyApvgg/373hbFxzfNxLfqUE
	giGcpt/g6Riz6NkXX7MlUou5cdiCVwf1iU4EdubtCMUAMaXIInspO7A/7phxpBwMMXnrni
	rZkV9tfz8DAZHHEWauVaU9rBP+Tv++S3UYDLeTolvZ+3idCuqEbKUefSgQYP8XNh+ee+cl
	9tGnoIPIgM5ej/IOTSes+0VBnwrWmuyeId3huadFlb3YCiE4o8SHFW1auHf72LHKc0jLnO
	wcACDZZYitleGOluF4Jki8+2NRNJjKnkwTglkvLdMZ3J3PcuVQeAzrm3DCSRag==
Message-ID: <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
Date: Wed, 25 Nov 2026 14:56:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@dh-electronics.com, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_163444_069292_5DB280A3 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.6 (/)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 1:56 PM, Christoph Niedermaier wrote:
> From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> 
> Tests have shown that, with the current pin configuration of the
> eMMC (usdhc2 interface) read errors can occur with a certain
> type of eMMC chips.

Which chips are those ?

