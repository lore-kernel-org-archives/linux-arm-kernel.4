Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1833F606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e6gwh4bT;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=UrOqU3G3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HQqBrTbEZxsA8ilEZ7vX7+ePIXnnagD5L9RGTt8hUKU=; b=e6gwh4bT9X33LA
	d6SMjReHaDOTpn0vToji7TVGG/X9DycTnzeQciU/8iUZPY/fbY01Z8xOphnZOUUet5guS6yIL7xb/
	lBsysFW+VFx1zx09ZdZXh8eIEQLTNeGQvSqfaCoZVzrB7eQpzZoHsXwgU035YJ83hDSxi2KhF0CCY
	MeytM8hgnNgqh6sSi/NMZCJbYGjHimT1BrKy5gG1FhwrdfH/2s1hd4iAJLogqquqlEGvwfTQ88a5t
	098489UvbeKZIdlRFMli3Oc2/1I1/pUV2Bq03MQsX7u9Jex3Ij+tqso25oq3astkYfCY4w+kAUZm8
	JPxP7tP7Fqfany3FZ1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROGq-00000008oyc-3lyI;
	Thu, 12 Nov 2026 06:26:52 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROGn-00000008oxB-2ggi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:26:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2AEC10E394;
	Thu, 12 Nov 2026 07:26:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794464784;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HQqBrTbEZxsA8ilEZ7vX7+ePIXnnagD5L9RGTt8hUKU=;
	b=UrOqU3G31RyOiOqFQExBFk/gH/aWva67ebwxY/V4/r0OTjA6A1UFpegkRCSIk+tE0mFD33
	Wtq9qE24rFg0BigDkfjPT5qwA8YrIwZQ3w3riH6OlpJm2nnWA/jN/cHH7CsoiG+Zjv5H8s
	E/36RtsB4sX3SoI6dWvu3cJq9oiVsR3iyJSf5l3MVmnzmE8thu8sBqXr3R3PmsiNsje4+B
	u/2Sg8e5L1PhKDwi2FUzuKeGyk3GJFv1gMY3l1XSVsP4WkfoC2zBLgDqUQQVb1pWSd3hmx
	oklxgLxwfH6TWsiJPNTQWy0acnm0ueUh9EjoilfioFqZJTV4QX2/rNgY2fFCNA==
Message-ID: <c3cbd7ab-e689-4a9b-b311-af43980738d2@nabladev.com>
Date: Thu, 12 Nov 2026 02:22:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mmci: stm32: handle mmc power up
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261030215427.488298-1-marex@nabladev.com>
 <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
 <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com>
 <CAPx+jO89Z0Z241L1jyB_3sUygdEwGicqT-WfHc6ppG8egHUO2w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <CAPx+jO89Z0Z241L1jyB_3sUygdEwGicqT-WfHc6ppG8egHUO2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_222650_007151_DCEF002F 
X-CRM114-Status: GOOD (  13.53  )
X-Spam-Score: -0.5 (/)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/26 12:45 PM, Ulf Hansson wrote:

Hello Ulf,

>>>> -       if (ios.power_mode == MMC_POWER_OFF) {
>>>> +       if (ios.power_mode == MMC_POWER_OFF ||
>>>> +           ios.power_mode == MMC_POWER_UP) {
>>>>                   /* Only a reset could power-off sdmmc */
>>>>                   reset_control_assert(host->rst);
>>>>                   udelay(2);
>>>
>>> What exactly will this reset?
>> The controller.
> 
> Okay, I see.
> 
> In that case, this reset also makes us reset preceding updates to any
> other registers, for example the clock register. I would not recommend
> doing that here, but perhaps there is no better option.

Does that pose a problem in the MMC_POWER_OFF/UP state ? I agree this 
would pose a problem in the MMC_POWER_ON state, but here the card is not ON.

> If I may I suggest an alternative solution, perhaps we can manage this
> in the ->runtime_resume() callback instead. If the power_mode ==
> MMC_POWER_OFF, perhaps do this reset there instead? Would that work?
> 
> Anothing thing that caught my eyes was the MCI_STM32_PWR_CYC bit that
> gets written at MMC_POWER_OFF. This bit becomes cached in
> host->pwr_reg, hence it's also rewritten at MMC_POWER_ON. Is that
> intentional?
I _think_ so, this seems to be used to power cycle the card.

