Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B9F606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nhUDZZTD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzfB+NX4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=; b=nhUDZZTDg5iPse
	gYdax7YhpFqpHpUh2BRyfdc1+PB+/evfNr+kfZ80AHx5iG3ayOeFqNmxp9gg37Rwzg1mW4l84LHaL
	6ODdHm3qV8IBnXbm5gf6CChTQw4/mnDJ5yKXRtf/hKv+7O/6ZRtnVe5rfSaMZobQAJ5k9kbG23f2a
	btjfk5zjunIVtQmkJ7sDk9187/tRoewlpe5gyNuM5N+6m92wcvV5cr43ioqJ3p4VK5fiPSjwkYwzT
	HtT8HbyHnny/iIViqsmKPxXr3JoCfwbtYDmelcKqUOd2/5O1iQp4eKne8zwveTTlfiIkz3YJA3zqV
	yfh8BoqsgqQgIYU6cvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxUm-0000000EKi0-127O;
	Fri, 13 Nov 2026 20:03:36 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxUi-0000000EKgx-3sFi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:03:35 +0000
Received: by mail-oo2-x09.google.com with SMTP id 006d021491bc7-717028b412bso511882eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600212; x=1795205012; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=NzfB+NX4RYjblCMOdzAduQSPk5x9i+JEPFC+HtOEpwqTLvN5dKiWv46tzXpJyC0lnd
         3Gf8/pyv2gEgpD3MygdBeAE4KqpAQbpCk1bn9d4ejeff0J+u65OiQmXgiencZ1gEYH6v
         munDx4a5YkWU2seErH54w65+2z/65cmeivCtaNkbra69fxq/IJViRD/eMg0HZzm0WwoS
         9yx3QjnQwoTAdtZG6yHiQ9u3ldQPp6UjRkn5qO1BfQFcXobqAnH4R0L+zXmSp6PwKijv
         3Lr3rbazI85xEkwAAIFMGfjzQ4wednipEGWRrEbSS8KGELkzGugUgcEzPHgj2D1sfkFp
         DumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600212; x=1795205012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=S5irJTdo61N4HCb2iIc2cNaBKQ3sdS3X6huDGZhCzT0xvSwMUHlNI2Kw34uTkYnev/
         ogr4Z5NrGQ0DXSAHwtjv4ISPc4csFblDw9LsmNUihJBFuwPX/uK9Qz36hQdZNHYOG48K
         HURL5hk01MWF6q7k8FjVk058oG75hsoyYIGcWLpkqWvDeob7c17Mz8Gn6XEKfdsmTFjj
         kFGCd8VHtKJm+bYo3cAhGreLShsrRFSLFY83mK+LYAgxeoBZzY41N3tutlSlomAupy5d
         mfvBoFClupH4utsAEmctXLxrjhHMQSNy1WtHFi2F8E2ArYOZuBB1KRhvGN2fbfZuii9K
         1dew==
X-Forwarded-Encrypted: i=1; AL+hErHD6Nn1fKQyeWdewdcoYWevNS06KH0VSuqL0Sq245RnsiIVD28q4fR5ilh1JB3WPk0DERK2YW7F31zZrv57fU1N@lists.infradead.org
X-Gm-Message-State: APuU4Z+koDrQ5RNx5EWqMU0Dv/CEgNf9bLV9Cll03M7l1EGDdtHAgdwB
	tuO5gG0REmJs14IDp2L+deKm8P0wt5LEgcxgazBkcJJ2xYmuqViaBYEa
X-Gm-Gg: AYBFou3RlFZ1U8V4L/ADZ81dj79AjGTR2quf0pvXEkbUemrbO/oCarxaQzOnJEihqF6
	tJBlett3xyGUUAYwHiAwumtMZj+k2svDql4iIAkPmKR2LOpIh21eg1AKUECEiC4cOQD4YZVRXE4
	s0OkQKqudXIndXtmh3GhuN8G7rwGMa3YXs/Lt01I6mi+r/Cu8RavCDIPP0M86if/ap1Lbpyf1in
	8qbeyYhED9R8R07FG+sy6qRc0tLN3zaC000phI8BtRj6wX3BgQrMztsZG3vbvlCv26pXx3utBLp
	VAkG3HCNmbIynUtPqW7iX6MR7pQjqZROwp/syeoRDsQRQav4Pn/IABGC92X9JCI5vP38gDXSEZ5
	18X1CCj9zFV81YQbQhL9wFGhR7x9Nxq3+m4r0z2sA8sjXv9vsYywxLuK9G00gOxbyvKzH5ybOG9
	Kz8xYrim8tiDbsJe9AqmQyGJX6WznD+/U6JXQw1mdf/BkqjSv2c87dnU1t7VEwUyR7K16v8mhpz
	7ddXE0IMcC5f/dCBhI4Wa9Zsx4l2i4HbyCs8z3zknP4TFT2J9BlQSAi2H24ng7pObCfqZigcKuP
	QOg5TFtDUBXCvD4uvdKQ1/bY2VeCvZb/Phqkok0jZ2LjqA48LKjleVSKCre0sPV2G4VOhFKdd+L
	tb4CF3AGbj4bIhiSo3w7vVPUOmJNWad8NiB91Q89C
X-Received: by 2002:a05:6820:f025:b0:71a:ce4f:4a86 with SMTP id 006d021491bc7-71ace4f7613mr375277eaf.56.1794600211873;
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4335912sm2485972eaf.13.2026.11.13.12.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Message-ID: <a6bc9228-8e81-4f16-bd26-2d9c72e9998b@gmail.com>
Date: Fri, 13 Nov 2026 14:03:29 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
To: Lee Jones <lee@kernel.org>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pm@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
 <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_120333_869572_3D1F888C 
X-CRM114-Status: GOOD (  11.87  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 12:50 PM, Lee Jones wrote:
> On Sun, 01 Nov 2026, Ryan Brue wrote:
>
>>   
>>   struct mtk_rtc_data {
>>   	u32                     wrtgr;
>> +	u32                     con;
> These are terrible variable names.
>
> The nomenclature should be self-describing.

Hi Lee, two things:

1. I have a v2 out [1] from early November that fixed a null pointer 
dereference that Sashiko found. I can spin a v3 or resend v2 depending 
on the response to (2).

2. would you like me to update wrtgr as well? I can add a patch to a v3 
that changes that name in addition to con.

[1] 
https://lore.kernel.org/all/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com/

Thanks for the review,
Ryan Brue

