Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E26606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 21:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UWOl1gHG;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=GEv9vjch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WrHCNL0KXrXk5rA5zdalOrV02Xy8jJVbUwtw3kWjMOM=; b=UWOl1gHGMoBq1t
	XsFVBwCCO33OdDI3OdopXSzsHIqjBOdm5fuErn84ScFnkEo1hhWkO2yw7yynQfMOznXOUG0wKGs8T
	TxZlt0h9vrDuLp9xtzULJx5Fv1QKoM57NY+JYrwCFTJLY8EWq+o9/UJ9h8L5RcrQhRHY/lA0FGqrO
	lZeojdBko4+ZjMg1NKKJRxu4P5VHtF9FvFudfzl397pCHK+woA/krEQpQSUOs0TCbJg/1JkhXNP89
	7bLnuZpKAFO59HofEyLtvi1ZFCRwWo790JAv+CBJebXG7k5P2u5skMU4/EMlk2fsp31xu95ly6mrw
	vAzvUOrGI33mIwq7IWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiDr-00000000Zpg-2kEw;
	Sun, 15 Nov 2026 21:57:15 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiDZ-00000000ZmU-1qil;
	Sun, 15 Nov 2026 21:57:13 +0000
Message-ID: <e526e0df-d3e8-4c6b-ab50-e9b4cc9bdd3c@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1794779809;
	bh=Wsvy++1Jhz31GNLY6mcfL2ulnfXKznpBChaXnW8X7ME=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=GEv9vjchECQHtag1czQFsuwD0vdspJK6CbtnGjHm4SsKXaQjIMKp5blcTP+3hWOmb
	 morU1X6i1QQuY6BlyafEREoxPdQ2ZcQ57pY+krO6WuGQ2vyP5i+pUlJ6WirubpYM0O
	 AFn7GDQ8CLgYTUlu1lM7iZg+A1K1SvVSS5ZzgXuE=
Date: Sun, 15 Nov 2026 22:55:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v4 0/3] Add T7 PWM bus clock support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr>
Content-Language: en-US
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_135657_944195_EB5286DA 
X-CRM114-Status: UNSURE (   9.66  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/1/26 18:55, Ronald Claveau via B4 Relay wrote:
> The PWM controllers on the Amlogic S4 SoC have a system clock that
> controls access to the controller, in addition to the two input
> clocks of channels A and B. The A1,C3,T7 which fallback to S4 have
> this third clock too.
> 
> It is currently not described in the device tree, so it is neither
> referenced nor enabled by the driver.
> 

Hi Team,

Do you have any idea on how to move this series forward ?

-- 
Best regards,
Ronald

