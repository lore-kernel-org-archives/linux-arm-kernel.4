Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A47/ufeg;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=BJqKcKPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tVqWo4cVCxBufMJRq8N/ZAqWxdIZ0UAwob+ppyXcu3U=; b=A47/ufegMqzUWo
	cBYA4MWzQYvJU9IxDUWD8ZxHXdoDTw/uLjxDbZ2RIT9C3W3L6NB2POzBBgbI633bDqMRPJ1g7zw6i
	ZLncR5TUtmjQ0XmZidSi0nAG+6Q0XC8UNqEqc8Q9R/9L8RI3Gb3SG4f7jpvrZodDt4XmBN9UeOaa8
	mrBWbjrelokd/btRbarYRIB//z1zPEyEqHZbsgcAd/wSZASlx6eG9MwyQupfwcdBVxOYlUMQE/kld
	Sm+fcavhSw5JGbT9swGzTmWOZ+ZYESVVPAOhu1EFkMupgc9J0hckahZvi/NNbobYTUMeuYEAuFLQC
	vyYkUAzptdoJirEQqR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRl1I-0000000BnrO-3utG;
	Fri, 13 Nov 2026 06:44:21 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRl1D-0000000BnpR-1QAC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:44:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF69C10E6A8;
	Fri, 13 Nov 2026 07:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794552249;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tVqWo4cVCxBufMJRq8N/ZAqWxdIZ0UAwob+ppyXcu3U=;
	b=BJqKcKPQIyZTHht8rnp6/wF4liFZJl+SeRXYchiuCNM0JlAXNdmnQ8QQAwxj1Xl/fh+dfA
	UVlBqScY20LOgjyzSZltMux4qMdC6oWcMAb48KMaLFR6jlc4nnt4SSuhLJHo75/qhYCiar
	w24XUFfKEw7tRLbY/dapb6u4EY5yi3j1oGua08eHOAxheFtmAhzzxsCupzsS5jkDebEHup
	a4oALLWDRN+pOvhgRr/4TUUeg2QcasWfbxXt5jz3K6gHOmz3ISlBS5uHQ5Bt+9PSt0krTi
	97pE7tLSUHuRHslkfSHhRVgDWKPoUgCFmMkviVzb/JH1kxCejXx331gy8g5YPw==
Message-ID: <d218212f-191c-47cc-843a-d4587e478fc0@nabladev.com>
Date: Thu, 12 Nov 2026 18:13:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip ATA6563
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930214729.809649-1-marex@nabladev.com>
 <d8c3ca76-3d93-4abc-8a78-d23e0f018975@nabladev.com>
 <auGdT2kdxwfbB_ol@parshuram>
 <0865fe86-3ea1-4ebd-8ded-642eff159b97@nabladev.com>
 <avXqWxBQBK2lKPMv@parshuram>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <avXqWxBQBK2lKPMv@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_224415_530696_B0E2328C 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 5:33 PM, Vinod Koul wrote:
> On 10-11-26, 14:59, Marek Vasut wrote:
>> On 10/28/26 7:59 AM, Vinod Koul wrote:
> 
>>>> +CC Vinod, is this patch OK with you ?
>>>
>>> Looks good to me, I will pick this after rc1 (monday)
>> I would like to do a brief reminder here, so this won't get lost, since rc1
>> is now out and I don't see this in dmaengine.git.
> 
> I have picked it up in phy tree...
Thank you !

