Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA94606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F5n0sxI+;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Bebpf0X7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=; b=F5n0sxI+HMqB8p
	NiKEwF3fCKVVcuzoAfIlLMGSnH8tsUmJj0J5zC7yXIujN9IjWVAwih4nISGm0Xa02mHUhl47wzioW
	458bcVa4Was7Le2uvzibxYcidtXA74tOrTnLNWgGhfte9yrUC9zMLKEI+mJYpzFHWahZtQ85tJvyp
	Q8R4nT/+AqTVom0h5nfzBBkm/B3h/Sic2+X3CvXPuOYbiXTsWhuI8QLiot5hWeFNDOg1uTvmoHrFw
	IDw4XLVsBJFY5afp701XbUroE+I1ueXY2YcGCv1byuOPMUSW1gCZ5VZRDPWphDXh8U2JwOnYi3xju
	qM15lUg15I9FyOzLhlTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeDu-00000000HI4-0DL0;
	Sun, 15 Nov 2026 17:41:02 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeDr-00000000HHP-18jy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:41:00 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-8b349d21fd1so15782797b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794764458; cv=none;
        d=google.com; s=arc-20260327;
        b=k4TTTk6DUiiVAjvSGpuSxq8ecgGOMxlmmSL4MfTtqe6ry5kdCQER2MvoDHgRtG94Bu
         YHhGCk859Iu0vqAZpwaNsO/dFrRA2HYq/nzj+ioDxzFjB8VIdWVtv/I21doFo8nPFVI3
         2dm0tZN+qd6P9ZK5IEmr0MUQvrWxglJuV5mEABPDOhU537Gaac2TVxCwwJSMscBv1IeY
         1pj4JP4w3fJA/Cbmx6uUq+F0qdAfUYnJI+L6y9OTAwDShXhkDwbQmFaTyIis3kuXip9o
         uA/Ug2xvRw2jO1R92tPaiugOzMh8toeHC/NnXayJKQ+ILCZiMks+4zVYM/L/LMdUMJPj
         90lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        fh=UGOZs35lnKmqFgZ7qcxebomnYNNtc/VKH7G6qbAh4Go=;
        b=AJaOXrVZAOSEfJ3P8Fq2tEyOXBcrchsUsW0G30L38YrTwMOA+tPQMlkURhLUMEvxAD
         oXlxC3HmR1c2S49uog1D4paGOPRrnRui5E3fsw8js8eM1gx2zP9OqvyVhWY3mjoAz6Th
         zySIQJqxoI2K3gt211+iP6eYDNq+ypZMRo11yuUe254YZQNF+8B7vdXLJjWswbvRVTlr
         KLqmAP0e6/HE1MiCkXocjamSnWtIIXsNdNK/f6Wj7o7uK1RsnSm+ikOQFXf65KrJfEAe
         BfyMUsStP1IHk9hYJ7voSx0LMe/IfUOjkNRz3jWOMHFOlxD/SwvJM3K8j/2pxqiEbneT
         BOKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794764458; x=1795369258; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=Bebpf0X7kgyFGzM5lm0Vcujrl8AzGCZwTiZbtQimgcNa8eT1QOSofpaHv3fUeWdGLZ
         +hD3fM23bXKX/bdBJU8CoEvslP7wqGri8ajyCNS4EJz2TPJHwF0Kpz1HrETGfAstSsLI
         zbmvjRZf8L2Bf9cO4x8ksxUxg9id7hj5M6Vc9EbD7SWaRH4VnaAxdH2z9jHgAhGmKkh+
         ni9ypzOFNfJ2XDucnqOAzURrl9DD6Hn/PvadwuP4VbEvZCFLgKDg0BZMttJNf4c8Qeyq
         Pswdyqirwp6OkMtXAdyS+ZV5NrCOeofAnfn8jNf6sognasocVCcJEn0YiCQn10yXRF0B
         A4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764458; x=1795369258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=SlznRr3vyF4fnR8BEaDNygUC/Yo7Nrjc2uqts36ddC3vGzWvy9aIpygergx0YPp/ln
         lx5fcrx4V8yw1t5B0y8DAmpz/cFdKeyxrah86//MaWaIqeM/ylSFx9uvl4MskJBrKnK3
         fyiQEMrophcPtUC2KaEhdx+PSb9j///hnq9M2T6pIvKJBIJ1OyPqwEb9V9FtxbAus0Xw
         9/iBv87PgLF4Bbh8WbC0db85PFeI4vVPlnX+SpcNBWf5cDwgWbF1kCcj2fJuTXAcb/Jt
         rX7IBdzxU9rDNdo1j/tNz7UTtPAsSOx8l55Dd3HFHVOUgLQ7J9RWAw9YbbHgUb9Q5qtc
         4Tpw==
X-Forwarded-Encrypted: i=1; AL+hErFO6SA89RfmCAjH4WnX3TAZMB51EDshy8g84MQIPHu6Lj45TP4pFRvGBaYvHaOCH2G15b04jI+RP0rtdneOHgL6@lists.infradead.org
X-Gm-Message-State: APuU4Z+UFn6qJxedMYq4OiTQGCqhlkLlfjsp6/pKH0SQmSE+3bxhh4rk
	r6FY9EH4CUdxeoUgjetPFr4/SkBLCRwvVr0E80j4DQdmrUDkB6TBWksgqUm03Gs4rvlVlgHEGkc
	U984syvItOlNoLvf84fo7nwBHGdGBokQ=
X-Gm-Gg: AYBFou0VfbSfDxeC/xOLB0JDW7dxApb65XDUk9/iHx6Hd8Edgp43MJpX2gJbKxArF4x
	j14RZHUy9KlhsOA80sg6344FtHjvR8eeas8eLIdSpIEQFNHj+y9JHBr18oKclO9tKmM6K8yA++H
	0XAOqhb1E9h++XUXWHic5u0q/S/ptmaT/YWAl5rt6lvfmKxAzASTOp0LKMUa/5qhdGpldDAfv5r
	TxKYcAB8MHzMDS3twiCmXSxtlxL3zQi39+q7IJjhHEcf67RThQZlCZrr7rafnG1xCjQQxLd1TeV
	cFfsTX6w3GSSxhEjUa+Syl/Os6Ujqr0YkPudQ7rhAOiOImI/0AZqi6LwhZJ+P5fxhwenAKTXd1M
	trqXsm43Fs28x1YqEv/+c/DpXoMupp5Och5fx3uO3+zhnZ2AfbCygdXIJiQi8xqf+xjUUqg==
X-Received: by 2002:a05:690c:d87:b0:8b3:4911:2dbd with SMTP id
 00721157ae682-8b4aa2f3717mr45349387b3.54.1794764457708; Sun, 15 Nov 2026
 09:40:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-2-tanure@linux.com>
In-Reply-To: <20261113121852.334604-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:40:46 +0100
X-Gm-Features: AclHuK_keCn1frC4iKcAHTa13eQ5wSmPdFzN8zUCJ22f34lvfbzGE6mvQz0vUGQ
Message-ID: <CAFBinCBc6=XPXCuxNLug2mRrvrA0EebNgxgxeNOKgVB7d58o1g@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_094059_318553_2313D218 
X-CRM114-Status: GOOD (  12.72  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The compatible property only checks that the first entry is an Amlogic
> name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
> the list. It cannot express which fallbacks each SoC takes, so a SoC
> built on a different Synopsys core cannot be added without loosening
> the check for every other one.
>
> List the combinations the device trees use: Meson6 falls back to
> "snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
> reports a 3.70a core too, so it joins that list; its dtsi gets the
> missing entry in a separate patch. The example used a two-entry form no
> device tree has, so give it the Meson GXBB combination.
>
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

