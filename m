Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA11606DEBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kc2i2H+u;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpO2XFbj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TJKl/9+9/GgYtmdNqCwcVE25Z6LMmrJm+ZVyrujB+G0=; b=kc2i2H+u0V5oSn
	/DQ26d/r181SRZ5DHzw6oJi7dZ9/xRmW0pZ9p0Is6eZB9vVKMJIAzX/y+mBUdFj2+mhUpb5HNdPK/
	Vx8TMw8EWDtnVZGSn8+zM83qpY0sOFfga2yPHDDR7aY1F3ZzqMPW2yIpuvBuJbdum7extZQI3xfFm
	QJ4FVi3KEg8nAn46nOppJllcv91Xxz4s5iKmIcCu/eEdMlC4dooNJWIsHyBF48TaGBnyuVFqrViI/
	U4AbAPH6hk5jnAu/BwLKyDkwAF/Hcyg41dfKSN7UERcB75tNPnkp8HHZGgCsUz/rmnWlOoZUz/tBz
	aprQ1EzP07t5W2PFwsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIT-0000000BLR7-43Rq;
	Fri, 13 Nov 2026 00:37:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfI7-0000000BLFi-2JGf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:37:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-490d59c3edaso191476f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530238; x=1795135038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJKl/9+9/GgYtmdNqCwcVE25Z6LMmrJm+ZVyrujB+G0=;
        b=dpO2XFbjU9ASw7gM3SnuSw4er7SkAAQYVNzSyw/Ao/I4AFS7LhzJlG6zqvqt1yAn2F
         QiWfTjX2ybYXc8nJS7Fxct2ucFopK8ENSM/unTWWSr6PFQeP81Fv+qce8qhFChKg+4MQ
         Ja541BKzSJTXXH2a1iDCcbaEEzzSWYw/wfgn9dUOm6GCI8QlgjsGiBegRh0zyNoyDTv1
         5pdaNo0yJhO6Nzgp5ZeoZ6mXIxhZASOGyQLRFuhakltm93kYDg5b8+ijDo4f0zZfZK8b
         MIqvoGwvOj+JRqTvXiEdo3ztAXPrh3OI2mbmyRc9gtxGrzbDWQViyLRA9gYGxphz8ZXM
         yYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530238; x=1795135038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJKl/9+9/GgYtmdNqCwcVE25Z6LMmrJm+ZVyrujB+G0=;
        b=yspoHRlqVJXos5eU0TAdaZAaFCepzMB0ZGk3WWrNcNC4q+7j4M9A/nvysqHgw6ieDj
         86sEwamLGAvFcioMivLEbwH/caQFKtZivpm8RM9cvcxQdXo2Z3z9vlzPA1YhpN6Qotbg
         oyf+EPsGN5Xu+DTP1uat27HmFwNjDsnEg0XObQKsbyLxaPOxZ+xbmbJG3Wl468+3KFdQ
         Ap3Q2GYOn+8OjDz43t0SZ84vEG6shVVdI6V9qqB7zDPBelWWUBL8cO7Gds3CNvuX0Cfi
         br7K1xg5XOhDd6PyJuBE2a7kx3SrLZ72RfVDIPcVF0V3/33/uYKTPYBEpoCHgAYCy89l
         z+9g==
X-Gm-Message-State: APuU4Z/WriFRUMlhka0Iam7VTMsmNJQPIfLSXiHMOKVqr2B/tfh9haVF
	T4wC3p18EvcRpw6p2XA3lBVFv5liIMtfSg/uhSVvY8HY7LoDEEv4sqjE
X-Gm-Gg: AYBFou0Q2BJlVJGE/dstn3nZphI0dBzd6W5X3IeFhUSxER2wsXJFtzEaBHtJUsFtnXw
	GxQmI1gGv1jp7vM24OwvRHEfQGnJWkfsQcvwxlraQYLpRDFXsBHzINlCLt3WFHJ1TbUIQMDVnIE
	3+/bRFOAKmCs44A1SM+bjTiUSvcbAMHAO6nKRicPGySSXw2XnljUZQ9JEVarlD2SnEz9s8jqvBc
	6QrPCvl5pD9Vq7HqMrSKL6whOPkklQ7Pery7VMvYXaKMy+IUxBYeOqRH0suRB/ZliU/VNQB6iIJ
	UFW3ZOyhCGtKSOq313Mh3yvD3sh68xUn/B101jdI99gSa7Cp5PKCMcbjBiEHnlXZq8+/DZAN+E1
	PGtGgh7Z2toD7WfA5fZ9nwvgEgkCdOj4D0SRqyIuGuZUdCMWcpEygQEv2ihZyH87BrEblpFOrAk
	2OGkVI8yE4Ls28goIz5SZ09F7g8RaHtJGHbv17XvWfJoGxBJK6wxf70fe3X6oR7CGoPmIKVQois
	cPf/JnVFMIsHIewPIFueQhQonH3ovGLatJ93GdG8vLwE/T6s8Miy4QoEjBXYV0ySE5Z4lcngrDQ
	qRwmWfttBR9UxLJrS0DmOqDxjyaKjbMmGbSJowupPq2A9paxJd3Pk7AEu3jEZ3UWeeH7xXoR7EN
	PTmVkxwx2TuRzAu/tALawYCOclz6KT64bhb4HVufIMUkCfSSK/epAe6QGPOem7irTZrUBUajgpS
	ysOnalbh4TKV/B5C5G2UpMui4hbUMOEW/MXGCYiw==
X-Received: by 2002:a05:6000:4b12:b0:491:1468:a504 with SMTP id ffacd0b85a97d-49c70cee81cmr2469854f8f.21.1794530237680;
        Thu, 12 Nov 2026 16:37:17 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm1937527f8f.21.2026.11.12.16.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:17 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/24] dt-bindings: spi: Add ZTE ZX family SPI flash controller binding
Date: Fri, 13 Nov 2026 00:37:16 +0000
Message-ID: <20261113003716.3666756-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-khaki-gibbon-of-persistence-a552df@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-20-ghahramani.navid@gmail.com> <20261015-khaki-gibbon-of-persistence-a552df@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163719_611902_92ED6962 
X-CRM114-Status: GOOD (  13.24  )
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

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> Where are all other properties your driver is using? DMAs? Resets and
> whatnot?

You are right. The driver used an optional reset and the rx and tx DMA
channels, and the binding described none of them.

> Did you actually test your DTS against bindings?

Not properly. For v2 I only validated the binding files with
dt-doc-validate. I have now run make CHECK_DTBS=y on the v2 H3600 DTS.
It passes, but only because my SPI node also leaves out the DMA
channels and the reset, so the check could not show the gap. The
binding has to describe what the hardware and the driver use and not
only what my DTS uses.

I am dropping this binding and the SPI driver from my series since
Stefan will submit a driver. For the rest of the series I run make
dt_binding_check and make CHECK_DTBS=y on the board DTS before sending,
and I compare each binding with the properties its driver reads.

From your other mail on this patch, none of the subjects in the next
version will have the redundant word binding.

Best regards,
Navid

