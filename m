Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DI53xg84;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lE0yXuke
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=; b=DI53xg84YyrgCc4oF0koTGpPpO
	6sQaoWKdfpi/1bYo6EJXYdwxtDRQq/zRl0kN2XscAqZIbOPy2QW2GLntz0fjnOayWoTCcqOKWMQLS
	bh2pAQjPtRQ6a5AEe06mJUQE6wU7HYs9VuXUKwywjL64yti9SQ+MiH7z4go5At3tp7PLKHwIILdtV
	l1u6irvWbwKiQWdROiqIuJo6soE3FnsXNZN9OTh89bs95jZdg/LQEe6eMsGoKZzYVmMmHFXBWB9fO
	OQ6D4uXgjP2JPyhjYJbBwsPhfmS50LHSU+XyAPXqKOeQ/OPywKo9tcYMO7wuxXdDSwwG5Q2gsysDn
	tjgs/uRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNCW-0000000Be0T-0J7O;
	Thu, 26 Nov 2026 00:19:00 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNCS-0000000Be0B-28tT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:18:57 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-386d1859e1cso1046730eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 16:18:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795652335; cv=none;
        d=google.com; s=arc-20260327;
        b=Ltm5I0fsb0MJ/Qb9tKa9YFGtCMZ20X9XCpohEmdVSnPNFOuuzrbm4ZiopJBcSqvAPg
         UxgM/I8+n/EGwwoCCdkQypPtc8WqihSHQtU14vUObwopwr4nAUXHBWGY6o32fweZcIuP
         WER0VXFPup4zOXH9ct/JlOvAZzLq/bC2lYNeS4T8AC+icxqDz3F0bopyBaJ47WAIdHfk
         AbKvV5jwvy+iiPrbaHyubnMX7rjjETsI0iA1qT0LKVk4zc7I377PBRIy1fIU8Q1yXi8b
         RPYysVJ5G+J+H74VHkPzJGAnjHeZHJiLC6aTv1tcObCec37ZkUE3U9h3mNCWqD9NLtyC
         UBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
        fh=w/kHEu+8Hch2nTJKR7xJ7YAzQ0Mlu3Khz2rz4YGs6mA=;
        b=Xm3PhJ9/ogFzFmFr1pfQ3LpAWqoVv4hKy4NJrkrowsG/o60I5byQYNBBNzhSHnTZYF
         adrc9OqB3A2yLEmoFxyjikNRTtJjXEWPNnqRr7IX+3a6SDigSNTfVLTbQXc5vmtTF7Fh
         P/yjVPtmRiBxNX1FFosd++QYLcI0YNghUKW40YBBRxN1cPECRGK2qAiNQUBGcXSlKY+m
         jogPLHbpXDSoAKZUPYbyIKK/KABv1XDlJfRPjp1CJ2vMGcepur/8h4lvR/XDV/SdVkL6
         gUAlPKHE9s0Yxy5fZH67aon4OfySfdhs/1a6T4PaGDB1Y0sFDtqCQ3iq423s1x0jIqYu
         M04g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652335; x=1796257135; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
        b=lE0yXukezyc0YlwAmrvJupLPI9ao40O5E6kKexLsyrCDyqoad00iwKHfpXbv9yClZR
         SVddERpMMUUUdyrL4nCYnEf4l17GCYcuQLid/y8CU4qCCh0/t6LaaB1EoQMCSVXe3xw+
         l6etT8huKoneqgHeXYl5E0KdPstmFOxH5X0IiGY52siqe/4b/y/IPXZELU4Nfa9x2NSo
         GBnBhh+L4Ua7jbXMs4wKRtmpJMf5QsO/iwnfvnOIQ6dCXaXCfPE5z7jrsevGM74L8fCd
         2NHix5NwN7s0kcQxcJsm0S4Oy1Gw0legFjAYUezhdywykNfXwQd88rmcPfHLQz//XMQR
         /UFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652335; x=1796257135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hs+NtO3DvgsubFp6mHbpOQTQRimp/H6VNRhIAEyqZUM=;
        b=Dqrbqi3Jk6qry5Dg74Ozhd//kXvW+G7wHPdOGmV60rOzYs2NI9oWiI7PfZUjkVqbro
         0h9lmtYViHLzFvpQ53ZicSx4Hf/EuI9rR0ngV2AEgHluSqdnAJlBGt9bgjnoAkfBTH43
         YYW0ynJlbEl+mc6DkcOFJJ4W0aDWZBjYsBls017Uz3tsh0VExXxUiOc/qD4BIddBOA+g
         Da+ZWjCQtqry1iaND/eJbYGuxJKu2hsRsnzX4kZfxb2Zp0zbbNmeVMPGgJO4sXwjdSpV
         NRuipqbkdqFepdzcrKJGVLABG3H2tH/sCZWQmcY6atimKQEvwf9t5tS3AUmwp3i83en5
         cAMQ==
X-Forwarded-Encrypted: i=1; AL+hErFgJiLL1VvCNLUJLG5Itsu2z076UDbKX/Sfrs7QJX7QFXs25f51EfExENX6C/lDGuR55xaAcr7A3Uonk13Kwc3P@lists.infradead.org
X-Gm-Message-State: APuU4Z9GTerNy97JOdnKpQmovRPjPWQrp6SS2Y9KZy6AZV7q2cbaOXxl
	H5oF9rRIlSO7iUP8XMXxiBd7xLf90j/1a0CC12wvYHH60j7DKmUApzwXMcO2V7Wkb5sAYKmJ42p
	0Pb254LW/2ZISKOeo5l8h8xAxk5iDEsc=
X-Gm-Gg: AZFdTZfHGBbRfQ5YqisGEHNIdpWFFPKp9TCQa6uu1TXK4/eH2+OVFv3dlrDno8/gZDH
	LDfgGFMAjK7LqJ35Tx/kIYAD2EvWOfvPF9l9s9xZela43VMvVwOMQgR0gtlMaMz6i0Ujj7CRiiq
	j7O7SPB8fTR0sGDc6DbMLlIktuCzsEBeGN6X+6jJkMfv4IAw8RHZpq3cdbaqWhqayOr6+xxpDb5
	rWA14IZtH84oxIvFsVAYwClvLh+TfD/jqFxTbkJqK/y5t/qoZCXGT3qReOaa9Om2CA5efNj3/X+
	4QUDR3pDpjZQe7Md9mRj0/vx1fPIAN5uClPt47j/cAHSQVCKvKmOzDxRTJIa8nHDbhuUx5Ll0y3
	tv+gvtDjp53QBqpsiYwTWtdu5cwYMAEGg0fffaqs=
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id
 5a478bee46e88-38696fb2022mr18962402eec.18.1795652335244; Wed, 25 Nov 2026
 16:18:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-9-prasanth.r@lineo.co.jp> <84e1cc8b3977f011950e68ca69c46dff1a395175.camel@crapouillou.net>
In-Reply-To: <84e1cc8b3977f011950e68ca69c46dff1a395175.camel@crapouillou.net>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 26 Nov 2026 09:18:19 +0900
X-Gm-Features: Aa3M54qYngOgeBcgTcKEBPIYWY5OQaxOihLdYD94YpYTWZ1b5b1X3H2CZvSNV8c
Message-ID: <CAG7eodE36AzthJZmMhTTPn5BHjD_PFAabBn=yiyVU++gAbDEXg@mail.gmail.com>
Subject: Re: [PATCH 08/12] rtc: jz4740: clear the wake IRQ on unbind
To: Paul Cercueil <paul@crapouillou.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Support Opensource <support.opensource@diasemi.com>, CL Wang <cl634@andestech.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Prasanth R <prasanth.r@lineo.co.jp>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_161856_570937_D667DEE3 
X-CRM114-Status: UNSURE (   8.60  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Should probably Cc: stable@vger.kernel.org then.

Will add it in v2.

> (Your family name is R?)

R is an initial from my father's name (Rameshbabu), "Prasanth R" is
how my name is written officially.

> I see devm_device_init_wakeup() can return an error, which should be handled.

Working in v2, it now fails the probe with dev_err_probe() suggested by Marco.

Thanks & Regards,
Prasanth

