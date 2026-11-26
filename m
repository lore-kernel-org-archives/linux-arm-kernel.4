Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2BA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ncER4BZ+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CCLDZWQRoh49McRXudkta9FgHcZJSiTahx5SXauGkwc=; b=ncER4BZ+WmGgmM
	rJHoG+5eL3OXrWIwNj2gjvw9KwXxSlaX8fL99OaYfLy/slTarVfhzgo3rWiAC61Lil8iqidAt1ApV
	t+7YYJwNOFgxkHHxNDDXo88LAZG5KUDHKaeEvwga4gX6gwkyDIxjNbV6d68pqsxD/fpYs2Gx1e39i
	RPka1emIZoedWoyXhDOFZSan6YwiyHGJirQG8L9hBI5RnkG9xUWBTNmudzJDwcP0Z44Hy1xC4atiC
	OI5+f0gIykQb4BWTrtqdRPWZlUMxbDpRSCNNO44GoScpAVTgM7YyL73cVSVux/fx2tC9lkZ2vatul
	G7z2dB0jKVFcyqVRWSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhOh-0000000EbZw-03Jm;
	Thu, 26 Nov 2026 21:52:55 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhOe-0000000EbZT-3LEy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:52:53 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so52388457b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729971; x=1796334771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCLDZWQRoh49McRXudkta9FgHcZJSiTahx5SXauGkwc=;
        b=ZpRU+NVHzacU0VperEjttGk6gz+EGHglzpftbTJuTsrjxk6nmMVtVYmnXP1Q2dAy+A
         Gf4JcWEHKf02zXOTNlSnXl7BwhwWncB8B62bFBvpXxwG0vHcC5lX2qNjK5C9m2nRFasi
         nhd77zAf3KWZKrbS0eG9P4GM1hUJy81/SykEOLyOz+fE/eI1IIpueX7N1IdwZT484YC2
         5CejbhgxE++620DASd+yQonqPE4zDdlQUsgfcbm3mf8q27L6GyjgqjQalO/lEH2ZSxWW
         KlOJ0nHAQFycv1FfXovbYm1Atquc5RjWfn9dKv18ghdKBPDHXIqxel2RzYnXmtyzlCVp
         p0fw==
X-Forwarded-Encrypted: i=1; AL+hErF0We08CZ1PjO1eqtHSG4iDnkWrODU7tLWF5a8zGevgVy+yaQ2gbLPFTNeNI3+Vf2H5SZaK8iQ9Ucyw8ioEUNHj@lists.infradead.org
X-Gm-Message-State: APuU4Z/r8+cE4syCdJFzEXzi1qA3kesN/yA2RErbimaVFr3DurWiRdNr
	rjBRcl2NwA+sCwSWzAPOkspKY508G4bojbsMm8kenFAvpJyFp0kkygPW
X-Gm-Gg: AZFdTZc0U+0ZMjkeN4D5BmslfMbN7TJI7qmiaIBvlwYRmlwd5cyD4EsGUKARL3PYl3k
	OtFPV7dTWGn3vdDNMIFlkc7xtzpL5fYRTHjJOiapFXJm8sbSyrxXZZiwoTGC5y2Qa2eFtGyN7Cq
	pwa3tD9LgccwfAPX1Naiv7+JYeJwuNtmwPaDbmL+D0Vhn7fmVPWyu1AVqZ9Mlb/tcs1jHi9iRhf
	uuK+5Gx7D1wxwjiZhjz4kJwdJsY3iBGQOJ8V3UHXelEswlWLDQSJMKI/FrZehTQBNXEYqrUppCD
	8wP+TwnsThhLqqnAICsdBO60ILbmkw4/6sFiNyQuYjNY3yaQTB3mWjcDklz0GD0GYtCrOCS7GAY
	yio3GE2V4wLhJr/k/54HQNefxXYj1nlGJTXWW+yyMxb6AqGPVw5uL/VRh2TwaXgzvoq+oxUFeAl
	4VpElE18/n2z7fBnRsBlQmmfuBDsR3Il0ypVOupASvf8688+CFo4FyZBgLgqMVD5031Qio0Iz4n
	4w9CFFKpqipIaSumaFCu9Q2iXIUApo6JDRJbr3Ry0T4IRcKNYiVVq8agVU72s/TwTbLmuBqJd3F
	wNXhL0ZJY/DfXVlCxIObidHQT1aLk+Q22tBxOvNqmh/A28VL0yoSmwQ0TbDuFg2IdXxLJwfYGe3
	+jiXh43bbu9SP3V6f+C80YXJ9T9YPUQV6EFv8+g1TLTPq1Mkp
X-Received: by 2002:a05:690c:e1e:b0:8b4:ed94:df25 with SMTP id 00721157ae682-8b5204aa226mr108746257b3.36.1795729971547;
        Thu, 26 Nov 2026 13:52:51 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67e6aeb61d7sm21209d50.3.2026.11.26.13.52.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 13:52:51 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: Michael Walle <mwalle@kernel.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH 13/13] gpio: regmap: remove irq_domain and the regmap-irq configuration
Date: Thu, 26 Nov 2026 16:52:47 -0500
Message-ID: <20261126215247.14838-2-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126153600.299724-14-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org> <20261126153600.299724-14-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_135252_863622_42FE10D3 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on an SF19A2890 board, as 02/13.

Tested-by: Joseph Telaak <joseph@telaak.dev>

