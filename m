Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C32606B7C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t4JeburM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywix7b9j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8NuJWbidnT5EA+aFxRD5SM39/Oj0VNhJI4etsJtJ9CI=; b=t4JeburM3Yj5gE
	QyhIsVzIFd8w5SL9yPvlSrQlfuy5PJxJZ/ZnRM5rzhsRvfb5t2w8pQu1LfyToCNQ4FQaXEVGntYYV
	1DJuWIcyYvpRDrmjDJw0dIUcIP7YbOM/ii2hCycO5T62x/6vUIprM+/TokWGIQCAVza6BoNW6QJig
	1Qa1cMFs2OKEEt2oLXe7/tcBLXvfS79ufLE5BW7xm0apaGYzaEmwWPTbvyWuJaph3+h/Ra878XIr1
	Yoa8Pm0ZNKfgTwfvs5KilGCGRmdAvDI9z1B1EkZtcHQ+R2RjysS3FKYB7pHSL9SPfVjBZLTD468wG
	TG6iubB/uvwOLy3MeS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfJJ-0000000BLw3-46Rl;
	Fri, 13 Nov 2026 00:38:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfJE-0000000BLtQ-2GU9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:38:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so5603905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530306; x=1795135106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NuJWbidnT5EA+aFxRD5SM39/Oj0VNhJI4etsJtJ9CI=;
        b=ywix7b9jrRXuAIeMXhv5RBJCholcE9Ub9J8wIJeBBzl9vnfmOSDWKicJmZGwkHmjb1
         8LXlj1JhfhUTY9LJ+TM7Sm+QuerRAaufpSr0ZOzSNTWYPsC1dYY+Tm+yFVvlCYQl1oBv
         KrVAu7m8arDPVhF8sj8JdX2uCKT/cIyuJSxpwvuPLCJZEGPtnkpdhgPtU5IM2OkWOUIh
         TKCiQkkqUesSviuVAbVcl38SW31BX5bMIUpNni2luG4QBJ7SgBEZiSX2k2dPWL1Bzprr
         lHiv6XJHmfrcdgoBFUi9GZ4qDj5fYieJRjU8aFR4XzKNyyKOAp/wBnppHhcvnIyjTtCL
         jdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530306; x=1795135106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NuJWbidnT5EA+aFxRD5SM39/Oj0VNhJI4etsJtJ9CI=;
        b=rHi4f2hOfwDztkYHCmWce9zgQ6RBh8jOdwklEuc3uN3E5Jfp5wsBj/9qPAcQQiMmZY
         U8XuxVgh9JJYyMnTKnfROQxNe0BEUarrEKCXvN+ZsYT8W8xqWiMbJ6rUxKw8oHqT5ZEI
         jqbFzKZg92F2VmLe5cOzVK5BJzWjcjRYlOuZUdaR6ynzU7jVPTTmZ0J+dYXCs+aka+0a
         F4g713EVsQVgU8bc8h/Zkh3rvOdjCTyJVl0V7zSR5LXSBuWNVuPgdUO6CDecBPm0Crqt
         7THsBSy1BxjU0ZPlnuESEeh97uidUg0hNGTpBXnb4tFHB/398tvX3yu42YSsFWxP+1Xt
         v4YA==
X-Forwarded-Encrypted: i=1; AL+hErE/KgzDItsoGunnFN92qiXmLnBvDhR2JCJYs5LJ8QGpeUH9AcuJvZVPITwYfQu17pwSl2AiCN7IqEByN+k7edeI@lists.infradead.org
X-Gm-Message-State: APuU4Z/vdPmeXVR1vxQv1qxUXnXRxFlVk20TU8oJR6aU4EIhUPfMmLS2
	U/SF2nJyCoDwVnCahI8jJOfgBIQyrFPz5PAnWl4smUnoO8TvQILWPu7n
X-Gm-Gg: AYBFou1QO2kIAvFfXPu376skDbRJ1mfYTWf2cpDbxXPm6WiLaxD/iLotHFN7mQZLPxW
	75RUxQA1qExAAK/6XmQWbTgoCzrErIwHEdaHjSnQsxuuEkJOrG0hr9CXzOlbhUIGrWn6giqneiK
	hzAtS4iPnaInXcL8kcQlBe8RKJaOSxe55M3ArRHGluYzdg7AsyfpwJTICdoQAVE7yenT8Mkhfll
	8CJaefplDafNXdyzl/mvynppGyqoewo83eWGRJPXUpuqFR1j/mvf3fdBMMUo3FlG4hoWM0zSmK0
	10dXScSATIDSsZU7LKvBAGhs3KgLrMLOaX4JEZ5jekoIjjSNxj4VeuogkvkBQVaKHNl8akBNwxz
	txd4q5br90Rayn8kV0rIVRAUPOFVRc8WOakukOFBL3qpIfbMuKLBJivUfbDiLITceFxm6oEEROQ
	H1se2QddIjwqgG3ua5NVvtMrPVeOaErvfnMpUpcDOgrjeB9nQLddwAHZkiYzCFOrEmgcNJ/XHez
	QwgMu03LO5+YVr2d2NucWbdzY8l2i4se1drBgY8TmLHOkywG7fBP59vlp0qFLVdoISDfgzHtc8y
	XWg1HIZZN0EQSqCrRI80GtOxWVGYT93D3L+fbDUrrCKxmTx2KgyMiu0wYU5V/RCobEJc/GwehwX
	ZomxYP7U2dQ49Ljzrg4gyj91pvxavK092UfNzID7oEYDE3JOAUyriSu+W2XCRtcC4SvXYyIMlh4
	ZFRwIWoN8/WgVvHRiBzgoixF/UX2K6cgWPIaWSHb0=
X-Received: by 2002:a05:600c:4e56:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4bb55aad2demr18252015e9.28.1794530306547;
        Thu, 12 Nov 2026 16:38:26 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ace535sm19669805e9.6.2026.11.12.16.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:26 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 13 Nov 2026 00:38:24 +0000
Message-ID: <20261113003824.3670843-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-9-ghahramani.navid@gmail.com> <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163828_590834_231F0389 
X-CRM114-Status: GOOD (  10.39  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bartosz,

Bartosz Golaszewski wrote:
> > +	struct gpio_generic_chip_config config = { };
>
> Don't initialize it here, instead...

[...]

> ... do:
>
> 	config = (struct gpio_generic_chip){
> 		.dev = dev,
> 		...
> 	};

Done in my tree, the config is now set with a compound literal like
that. The GPIO driver will come back as its own series after the base
support for this SoC.

> Looks pretty good, I love small drivers like this.

Thanks, that is nice to hear.

Best regards,
Navid

