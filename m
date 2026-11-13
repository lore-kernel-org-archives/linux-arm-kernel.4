Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7208560A261A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bhdMSfQU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VyXVmI1o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T2Yx0PhHKFT6VpgC4niEb4VKLhOeq/cZMiaB12P/Kdw=; b=bhdMSfQUFFIYCl
	sDqRVr4cDQR051dzIQ086Vt1z+0YtNQ4f2uHaDupP/cgzXADdAPJHrdrj2Fh/MVTGV6RQlY9XmcRg
	yv8JATXZqy4PitoJBF0mJwJj0Y3OlchdxenKvnByAtONf+Iq7Nbm8r317m5vo35WOf+U2TPj/nhjO
	atZvL+BWeu6WTpv44PQnCaZds3R2RtWEF4nXsfYXKFwGPx7+92cJsTriWwwATRHtIQCbf824/4X3x
	K4qYEa5x6fNtFmOadFwJmxs7NucPahnIJrrrSIikYNlf8t/3oPAv/jZxyfVKTYeZHZevEeoqQ3ctk
	hyHgiAlZPgwKE94sqJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGx-0000000BKmk-1aVo;
	Fri, 13 Nov 2026 00:36:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGu-0000000BKly-3D16
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:36:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b467581b98so2942595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530163; x=1795134963; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2Yx0PhHKFT6VpgC4niEb4VKLhOeq/cZMiaB12P/Kdw=;
        b=VyXVmI1oeekMzZNHLj7qM2q/WYQOt92NL+UMuyEKNzAfB5OYiCQHFKe69aeM//4xFL
         OF7LIWUclRmHwUwU0Ffx8qOF+ixmv0uuFJjqTS1Tde0atADJd8WIuetQuGNwGixlwTKM
         ARsy+RDKCR7NIGeOPvvsiY3RQC8MV3o5YSieEPlnWUYPOLQE3pCOWPi40rtq0gbrSHlf
         dw+gQR09PTuqHuoeM6hF6UCngwyx1xPgMHDalCOa18zfubiMIoMrjm43a4dyHGmc2it/
         pfoHzeD7tx7pz/k4P+NUPKba2+JyjcrHheuQC+kNHMjQ6q/Z28bgSBdW+sInLL9NlO+G
         iDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530163; x=1795134963;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Yx0PhHKFT6VpgC4niEb4VKLhOeq/cZMiaB12P/Kdw=;
        b=Jmw+gNYI5KVfjAA9BqfdbalsCROvQYJON235XTgsyTzzsh50md1wSdV1RcgpttskEY
         TVheIO9Gn5cGiFBuGC5yfmfmlxHwxueIwfXoDl80ha2LPYUMQymk5SrVAQ2T5X6WJE7p
         Zx7/2jhK83KZI33vqNqX4zSf66kRwBVtanstpkIiJv44xgcleaEc5L5QtgjzKi6oW22x
         JFkQwc3AhpKlE2gIUDpU+E2cjSMk23Xi2k6d7y/gtwk2Jfc5X07okgVwLOSC31x0J124
         +d2VqgiSJmK8CxdQE+5js9se7HH9yiKG0WvDMwM7wNuD9xUsPaYRWJvBR+WMgueWQrgE
         admw==
X-Gm-Message-State: APuU4Z+cf0FkQSzloGsXSKCX2xpYBrP6z3vd3x3MfTgh2Eoa0+AcOZQM
	6Q1MLGtkBQmK1CXvG68I3Fk+r5qydvxwOtgM8LKy3E6Ica4jQ8KnnpAn
X-Gm-Gg: AYBFou1vk9490Bqnb0Pe7CPZ28AOsXCPiQhiPBa5iGiSvzQRI4mWj8GJGg3rw6GguwH
	PniAOG0bcHzNGIXYmaCxnJMKcq0Hx9t8mfCqQf/wptuH+Zar0BswyEpc8GzrRx4OG0HPao0942l
	+aZ07fxCeUhshbHB3Y24x1ubdPPhWBItz1F07D6CmdUCZ7aPYte8WQgAVizpJmUmF26GbOhc/b8
	E8WCIqv98bHdsnxBfo/k34pH+HNbx8p3GAwVGHpKnIqK4cmvdjyvA6Af0Og0/Jn5xrV2Jo9+EiR
	GXdgS9H4t5Ri7Ia7dHFvnSBUIIK6ZlKat2YFiaep9w8vND2DhmUbyqj3Tw9FMeeMKVgoxoB2XCn
	Tok2ADJ/S2Y3x3kJ3tSBu8rFALeIVmOLuNI/kJgodEb0Kq80pVOAc2aA0Rc+IMKFHKFZeF8qscy
	CuI8Lmx1LmOqI0KoI/WGvJzRD3cNod6N5jJW4dl4ZX5bKXTjKRthV8kYwnvfhYO6qWON4CBssox
	eKIqa4Sb+oZoTw7HD7gKQhesazjhqaa3ur4dm7oki52eVbe9hIzEoLmTlhwA+fYV25z4+Vt1QaN
	m54+Q9fdU4DCD8dmON46LdyXLWy6vCV6FI18xBBdEtL2MiH05jhns2D6oLvgdV3gJgnOf8MUT69
	zdoj/k69Us1RsII/j9bq0gtfv3LJHjU/BWxdkgoNOXRZY8KrSXMvlJlubRb43RBx4Akp/I7kJa9
	lWGTA4Y0Pp4bGkMPg77g==
X-Received: by 2002:a05:600c:870f:b0:4ba:495c:3798 with SMTP id 5b1f17b1804b1-4bb55af1377mr17409355e9.35.1794530162764;
        Thu, 12 Nov 2026 16:36:02 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm2145402f8f.6.2026.11.12.16.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:01 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 13 Nov 2026 00:36:00 +0000
Message-ID: <20261113003600.3661907-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-9-ghahramani.navid@gmail.com> <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163605_108337_0B252D62 
X-CRM114-Status: GOOD (  10.40  )
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

Hi Stefan,

Stefan Dösinger wrote:
> Fyi, there is also Documentation/devicetree/bindings/gpio/gpio-mmio.yaml,
> which allows you to put this directly into the DTS without a driver shim.

I looked at it. gpio-mmio.yaml has no clocks property, and on this SoC
the GPIO bank has a register clock gate in lsp0crpm. If no driver holds
that clock, the clock framework turns it off as unused at the end of
boot, so I would rather keep the small driver.

The other open question is the IRQs. You and Linus talked in the RFC
thread about whether this GPIO block has working IRQs. I have not
tested that yet and will reply in that thread once I have.

Best regards,
Navid

