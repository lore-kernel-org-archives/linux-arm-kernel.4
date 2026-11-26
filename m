Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D3F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Ji4mIg0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nA3Z0k2qN8XhvQKCf+K+RDIV2RCsTI1GFYw7wVXa+Cw=; b=0Ji4mIg082XQL6
	TKtFwy6A1gTGitpawXf7oRKkNYQeuYM6xVP2z9ReFTz0jt6pcW5tZN8S4Idahw0Cua48SY6vqL/Fk
	MBrcBOukzWSUw4Q8Jjuacs3P2f02QXlNc1tNSZG4n9agHpDR/K4Ij9nc+N/WfAF1019qKWhrqpgkJ
	K/5sSn7ishnDf/CnQYXP1/Ygw/Mg6SS/5rfPXNR0vVRjWpbvoscW0MB5761v8tX1hiWxp7TjxnIs0
	DocSMJo3S7daTXDNCWpsZF8YvUFnBx+aVs4brq2sX4qxUm//nO3q5CJ2/GwC1yWMvoeT+wb1xwhs/
	EpKc98x7k39QdjyqHVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhOg-0000000EbZs-3HVm;
	Thu, 26 Nov 2026 21:52:54 +0000
Received: from mail-yx1-f50.google.com ([74.125.224.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhOd-0000000EbZD-2WvX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:52:52 +0000
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67db3a48dc6so8898334d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729970; x=1796334770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nA3Z0k2qN8XhvQKCf+K+RDIV2RCsTI1GFYw7wVXa+Cw=;
        b=ziSyElk/zn19+27toPSk5Bl24YR8GTM1dfKQv7+dK88vSjYtuh3DljFmSF6I06H1vS
         RnlHDf2U3xmL9DoD0puNKMfyV0vZT5jw/SJaCLcuZThz+4x4G+WsmD6Tu1xfwN9BhqjY
         HcpHNs24raL/TQ1vdBVRtpl2ujxrZXpzk5H50JAGmmVoxYHG+ZYiAlGLMHlyBVoJ+gc3
         0JeENmDw1v0M8GSLk8Q8QaPSwMDp3sOcEaLutQ7mGHK6m6lF+noWgvhpZBgSfDFn3Yli
         j3L1PyxqnsttXovc9rQMh7qmj8KSBe4CW+yGdncI/8jHeDeHcL4ysSO6vg6PDFDdFpTo
         EBxg==
X-Forwarded-Encrypted: i=1; AL+hErElwNI8AcNIkONgNcwfwiMZ6X1sWB95t6lTkdz+QLv3eu5NCkcSJaXph49KUD3Q4BI55TRJzMKfw+7JQWlBLUjb@lists.infradead.org
X-Gm-Message-State: APuU4Z8H0GkIf/dIVQQd9TZ8KmpInZvDn5Derig37hKUB4j0rtyaWmaa
	YnIRSP9PnNBHth9I3IERi7ihOqDarg1Y5zmRsLdTBpFORYDKG69bQwfGLxTjLSgtUEA=
X-Gm-Gg: AZFdTZeedKkZgt2Vrv+MB0mi3zxicjO7fEanceAOkMmEUp2zv/y4+ru7FpigJ6hQ6az
	2GzfkaX9gUqnU9O0XF0ijlf+J8xdOrcdGWm3ao0ibLIQom5MYAtzg0O0aOvTjFOf2S/cvI8hYju
	rgHgyeFpb4x284GHoryXRdWoiXPPiDQHnsTbuyy/4EovrwuHlYcPZzIlSSpmEVUpdOTSNU8Ca84
	ZvXJqQrzRVyd9DIZKsrZEjHZdjyGhbOgH9fcggI92LwQtTuOsSTsCq9QeJXcj1WZT/EYETnlWco
	+1w0IF6vchndq0sfZjpZvS8AGfPAQsTTf8VVOb+G5BLEoM4EJYA7vAnmXiaYQPmnkrWWaon+OIc
	7t53JKBJQl+6R9yjQ9HmqRz5DcTh3Bix8cGiMq2allTiov2345iVBEJwN0rznwUtoJnx57RAc4q
	eT2/MMdVYcSup70NFJHwYMabxOlcrTfKt4nVoyoUJaK9S07Y/fPz99e+xOVY1vC4ws8xAJWJ4HO
	FWBzp6xpENGQXkS3vda1yEX3nt3T/wYGwXCXoyKs26fSo5waeS3zX50+uWIRdE/K4taFisREBKt
	5MmG5aDXJ+WGeT57NpR3+tUBvHyBDhKK9wD8/BGC5My44ke0RhqUjOnUv42A8rLCh+h0iei5IwK
	o6F89tIK7l2HoLaeoITXSkjqo3IifVN0On61i2Emm6Ldky3Z/
X-Received: by 2002:a05:690e:478f:20b0:67d:99fc:2e27 with SMTP id 956f58d0204a3-67df43f3b0cmr5163463d50.40.1795729969868;
        Thu, 26 Nov 2026 13:52:49 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67e6aeb61d7sm21209d50.3.2026.11.26.13.52.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 13:52:49 -0800 (PST)
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
Subject: Re: [RFT PATCH 02/13] gpio: regmap: add a callback to create the IRQ domain
Date: Thu, 26 Nov 2026 16:52:46 -0500
Message-ID: <20261126215247.14838-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126153600.299724-3-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org> <20261126153600.299724-3-mwalle@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_135251_674154_A437E020 
X-CRM114-Status: UNSURE (   7.07  )
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

Tested on an SF19A2890 board, with the Siflower GPIO driver from [1]
moved to .create_irq_domain(): gpio-keys interrupts on two lines, and
unbinding and rebinding the controller.

[1] https://lore.kernel.org/r/20261122-sf19a2890-gpio-v3-0-3a4857ebc84a@telaak.dev

Tested-by: Joseph Telaak <joseph@telaak.dev>

