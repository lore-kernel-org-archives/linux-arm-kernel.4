Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA84F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 08:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hYIn2x3F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MVpe4YVq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=80dMFC0Ro/jAPdAujll83Boy4CMrv8kmaX2kTiPJvwU=; b=hYIn2x3FlXGPMwAl+Bs/dMUUiO
	YKZzEqt3JQ4wlgDI79LdU7vts4mP8zF+KSSIC6qbDWaKkAqqmAuy5gZeZLR2hq1CeSlek0x6Q1O7c
	3PQPawCLfjAkWSYRg11o2B2ZU2O/VhgACTncAi3P+Ov8l+ndXbEk5PqLPtFVBO+ysibZDhi1dVPRC
	OyH8rhbgirxCq0X+m9KE4Zhl6o/qfUIR3jZZCw+VYbL+NG4YRBKpZViLf6n8SpzRvi2Q7mS1ugAzG
	jsDsrAT3enI4oe9YcqhZ4RbLgZdSE/akzGt5cA0EKZRdViL2GrUZqeoaqMms2XGfeP6VKgZLQ70c/
	GCkTvaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVBI-0000000HCqZ-234J;
	Sun, 15 Nov 2026 08:01:44 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVBF-0000000HCpv-42kZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 08:01:43 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso348286a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 00:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729701; x=1795334501; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80dMFC0Ro/jAPdAujll83Boy4CMrv8kmaX2kTiPJvwU=;
        b=MVpe4YVqPaLS/jHe/eMejyrjXk760Rd51J7IDVU+DErEA4bThVYAGM9oPMHhNbTdRI
         KvFlupkxbqGDfiJJSMbLeKA3EkvZZjJfORi8khBZ//zkh6Hgy3GoH1K/HEKirYZar7ET
         iO7EuNT2fuFSi3yE/T9k0GCo4MoGJo0fFR/49w1axtxZyoyjt2SoMgc9gtgMcKLh+9FM
         mXzrY8spXh64ZbAJ6QCMw3WLT7QV7futd7vb0F0anhaKCimdCO+sreppl8zXx8J2bcwQ
         1YSN9WbnbJQByPPU8aPwAIgI75R+k+JCe8ZvtKO67FKQAq+7xXZOgbQJCO12vm5Fqg0D
         wAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729701; x=1795334501;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80dMFC0Ro/jAPdAujll83Boy4CMrv8kmaX2kTiPJvwU=;
        b=dJsNauepoBLi9RCWt40ovNHc+meW6DwAod2MfUGeA24iDf++uEYNuCkNgpkrhrdmTI
         dye/PUY5kr/q199MGDW/5lvee9C0RMipJJTPF+m3q93HAFWPJ7CqwmaCm+6kwrnl7mz+
         e3H5TVr5+CrIwbbtmo6mU1etuGLLWbOKjzX9XQ0tRllSp4yeQJspFnOEE60gwBXVFdue
         x98MEAWV58By8/ApHM068LvozFSM42sPmN3fj/Tpr1OXKOdrGLTnOjI80sv+WYGWbpyf
         Q6xf4QeWT7vdL1qJnCocJSI0GdQlROunSvthmrD3ow+jSaYxShKLh/UPvz8UXOHhmRVV
         y4Kg==
X-Forwarded-Encrypted: i=1; AL+hErExKYUlPdvkFx5irrGXpx1WzLxxUnf4pYDuwf3jiPgtPZutcL2DYyeTpGo2edUKgOq9GDR9gJ4Ur9QEh4WwRAya@lists.infradead.org
X-Gm-Message-State: APuU4Z984O6GTteJwtpJ4n3Vr3U3D8IhN/9wdDD8IAPXuIVcWo5dEJvy
	Vm1K3tydapA/BOuWGPhkhEeMdl0YRxRLrQsVBWGrO5jFs1s9cyR02YLc
X-Gm-Gg: AYBFou3j2YlhlpwSB0jN8n+ZwAQu+ROe+WoE+ukMRbEaJ5/BAkIJRxTqbbXCb4W1BbK
	nQpaqrITz55wk1MFRRd8mlsDEmiIi/zubw8hkGTcw0MEBP5WbM3KbizI5skgRjEipF01n6KZV8B
	R4kJQwLB5lobOUQYv03Kf2COdMQl1HoYZn3UJY3bFSsd2Zg/Bt1L51By2hPwSq7EdQ4SGqUetvB
	5A3dt/JsYFpT0uyQaOiFpHhUVJpp/7a9HsdHfCEvlZpciN+y1jqqLC1cBpeaHZ0zr6TaEk0VAPK
	Fjk6HUkmShs6kHXUkS9z7R5hwIrmDf8qs61UfMQ69WWWjjBOVBf+lstJ26zcLftrXggrMWhkpPD
	pWY62OxmBAr/exw/mX9SgRgK0ahq2cbo4aWOWR03yu+GUGTwwmg7rMA+XCGVh6TiiO2QLJjZ2j1
	8Nag0BVbQWRNTyhbV5gsWqP5jottLQ/fJGtQ0mOcl7IkL8PsSL1Avd9RzN6NmqlJd3OIRrErrfO
	oVaxe9sS5+EZlLvq7TYkYVVlPQiIJoQ0AvvXzFFB6Sb0UtPD1iL9vP0xA1TrpfKe6Q7raiY89Z8
	xtHeuEq+P5T1m+ezEDnhCLc3WYP7tbW9XkdJwY8aH7m/M5Xzdk7frnQcZQVxy3gxDEarpOoq6jw
	OqDqmIbQ=
X-Received: by 2002:a17:90a:e7c2:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b1b0608b39mr11786795a91.0.1794729701017;
        Sun, 15 Nov 2026 00:01:41 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm6224118a91.4.2026.11.15.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:01:40 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Lukas Splavec <lukas.splavec@puresig.cz>
Cc: detlev.casanova@collabora.com, ezequiel@vanguardiasur.com.ar,
 mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkvdec: Use dma_map_resource() to map RCB SRAM buffers
In-Reply-To: <20261114094916.28744-1-lukas.splavec@puresig.cz>
References: <20261114094916.28744-1-lukas.splavec@puresig.cz>
Date: Sun, 15 Nov 2026 08:01:39 -0000
Message-ID: <179472969996.3843098.1159119154248532841@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_000142_029583_8A951655 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on an Orange Pi 5 (RK3588S), rkvdec from media next with this
patch, KASAN and lockdep on: all RCBs in SRAM now use IOVAs, no IOMMU
fault or splat, fluster HEVC and H.264 results unchanged.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

