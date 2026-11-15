Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71848606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CDa7Fzq6;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=OTu8FLy4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fryKUfiblkRf5EZy4DapCqcWujvmZ+UyUkaCr01AeDU=; b=CDa7Fzq6gX/6nI
	CR0kwXknczUmmQLu5Vq+ph8y/v1QDWzRgMathaBuOMbQ9unUiHgioFc5HZvla0tJSaPzmyKgVjwgZ
	1LpSjiirTW4EQ6SFvVAcm43yXoMkzXgWcAmosYDpdgUWr1UEIGL+TT/gxgJyTChYapPthQD0JpJrg
	J4dEit1LfZPIhlR53DC/M0yTSbApWwm2lWO8vV1nePhY1YeWBCtg4Cgz/qtnQkOooEgNANQ748O0l
	JC4FstUVuR3Z+1vNbiV6yA45ukQE/aQdWR4dXdfro58qqo89GfS8ZwAUcRAmqecRmi+rNP5RHnXxo
	ysl7Io8gV72OOfaVaP3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSint-00000000fRJ-3lAi;
	Sun, 15 Nov 2026 22:34:29 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSinq-00000000fQL-2sCv;
	Sun, 15 Nov 2026 22:34:28 +0000
Message-ID: <6c03c104-a86d-4ddf-b519-793a1da7151e@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1794782062;
	bh=r7WkL7hnoxRmrnQQzh+AibupBsiHGW98gVTJzxJfnBE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=OTu8FLy4omu5a28TNtfvdyeXHr9qsC+pa9ZIoHaUjUqSJPqpymtxlEysJrWDTdt1f
	 yD1Zs9/FAg7EGkDfPHy2+V/tYUIb/oJoTq6xek5oDKBJiOtIGzTjJjxoLOnQESjQvX
	 0BoyrPCX3vaHjppBJM6y54J8UcfaRivtPgmNBOQU=
Date: Sun, 15 Nov 2026 23:34:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v4 3/3] arm64: dts: amlogic: a1-c3-s4-t7: Add bus clock to
 PWM controller nodes
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr>
 <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
 <CAFBinCCf2x3Ear_iOg9=KYXd5jbvAh2LdQb3uOME=Lry8Wm4HA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFBinCCf2x3Ear_iOg9=KYXd5jbvAh2LdQb3uOME=Lry8Wm4HA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_143427_180323_31B2830C 
X-CRM114-Status: UNSURE (   9.99  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/15/26 23:20, Martin Blumenstingl wrote:
> On Thu, Oct 1, 2026 at 6:56 PM Ronald Claveau via B4 Relay
> <devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>>
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> Describe the system clock of each PWM controller as a third clock,
>> and add the clock-names property expected by the updated binding:
>> "channel-a", "channel-b" and "bus".
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
>> ---
>>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 28 +++++++++++++++++++++-------
>>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 28 +++++++++++++++++++++-------
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 12 +++++++++---
>>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi   | 20 +++++++++++++++-----
> note: a single patch per SoC is easier for me to review but we don't
> have a strict rule.

Thanks for your feedback, I will split them next time if I have a
similar one.

-- 
Best regards,
Ronald

