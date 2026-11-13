Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18074606A889
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XI/EoviB;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GU+JXV4Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+xvWra1IEANazOUIzu9aYSpzBjP8CbiiZ/8VsGzinn4=; b=XI/EoviBsLFjlK
	+qd/i77qjmP7fMyIHnybB8xMlwvQLquUsX46Jw8+qUiVZh/HF1/cdDjcL32590++TVR58WRYaFlPg
	RubrKIAhE69y3uMwcAkJ6Rg7cxmiCyyLk0zV5P3OLV38Sug3PIagAgdIYFOcznN/l3ZKYthhIAnCo
	jjj/TUJSxaBkgckmM7Kbg4ZEku7/pKLcC3OoPNACSRbkLAFuaVEOI3rVlJIL8Be18B09FST9MV8NS
	MEA5NgsNESpYUbRrbVMqTbLPIeuZhHWfIuhfBJlgeRe6okRuBU+PXE57uIQTrHfJjv1JwEepBcjW0
	1B8DEb4iHjKt+nrV2FRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmaI-0000000C1on-2LZR;
	Fri, 13 Nov 2026 08:24:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmZQ-0000000C1G7-18f9;
	Fri, 13 Nov 2026 08:23:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B1D71C4F76E;
	Fri, 13 Nov 2026 08:23:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B0A5601D5;
	Fri, 13 Nov 2026 08:23:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF65B11BC06F0;
	Fri, 13 Nov 2026 09:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794558214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+xvWra1IEANazOUIzu9aYSpzBjP8CbiiZ/8VsGzinn4=;
	b=GU+JXV4QJPFmtQbnhkL9VJX0jszc0OySFQarr89JdBgAZRT+LZu/MiIgtdoT4ptk/co1XE
	vsGS6kdmJMih+mTBZiY42Paf0jfqPWaS0sQrEYRKCsRXuVs3h7y0GZEXx46e01IYQ4tDdW
	QgbC1iwhetxZ+CijzqOpweUJVEfygITk0Ez7uGaIhOga5s3OYpAQErtUi2dzqKRK6BXAel
	f1LdK7ZKYvepAKJhW8QHJQkwXkg5cZVDWJLuzMeHfP+dFCbqU3HDpW9Au/mKkXgY9FNqua
	Q5OELq4eunCmxyg9bXqytE5A+MO36ZAyOmCSDYGGl0ZQgkgkoW1VDuro8ehBYg==
Message-ID: <36ecbf49-0d09-4abf-a93d-fc3f92191f7d@bootlin.com>
Date: Fri, 13 Nov 2026 09:23:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwmac-rk: only read the delays the
 MAC applies
To: aiyengar1990@gmail.com, Heiko Stuebner <heiko@sntech.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
References: <20261110-stmmac-dwmac-rk-delays-v1-1-87abb6592921@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261110-stmmac-dwmac-rk-delays-v1-1-87abb6592921@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_002345_401746_69562CDE 
X-CRM114-Status: GOOD (  13.44  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/10/26 08:13, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The tx_delay and rx_delay properties are only used for the directions in
> which the MAC inserts the RGMII clock delay itself: both for "rgmii",
> TX for "rgmii-rxid" and RX for "rgmii-txid". For "rgmii-id" (the PHY
> adds both delays, the recommended setup) and for RMII they are ignored
> by rk_gmac_powerup().
> 
> The driver nevertheless parses both properties unconditionally and logs
> an error, plus the default it picks, for each one that is missing. A
> correct device tree using "rgmii-rxid" therefore gets
> 
>   Can not read property: rx_delay.
>   set rx_delay to 0x10
> 
> and one using "rgmii-id" gets the same pair for tx_delay as well, for a
> value that is never programmed.
> 
> Only parse the delay values that will actually be used, so the error is
> reserved for device trees that really lack a required delay. Behaviour
> for "rgmii", "rgmii-rxid" and "rgmii-txid" is unchanged.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

LGTM, I was worried about breaking compat but the rk_gmac_powerup() only
applies the rx/tx delays based on the ID mode, so

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


