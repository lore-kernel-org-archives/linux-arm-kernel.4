Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BEA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xBST3KDt;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=InmTmHUi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=; b=xBST3KDtrXbcDS
	LiYg/pT2r9IJFPyyEipjXU/ZktdGu7d/ishIVLwBK3QJL1rWlLjhvjnWPfQTkQGPMjLZH0jRRYGR+
	L3qn+iNTjQseBAhjQndj90iwquHZhV5ZqUv7cIaoGFA9FV6mOvy7wV6GCrN46LHuIq4kXuOP+TfYu
	M1VBmwodzRDeB5BMFdh6hq4k92nuxYCj8H2J/XtGG8C0zXsxDLwS/+p5xk29vkikBgLWc4Nz5dlHx
	iSKShpamc53qH+NbVHI0TxV5459Aq2NDdF4iKwmVCo9nvv4rfPJF8MFz68qGsgRtiN+xExP4sro1l
	fnWjZKBojCEBrfjUx39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhRX-0000000BX5R-22e3;
	Fri, 13 Nov 2026 02:55:11 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhRV-0000000BX4b-1wvd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:55:10 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6798eb0d190so337064d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:55:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794538508; cv=none;
        d=google.com; s=arc-20260327;
        b=eUCfGhtu5IF4OBrWBZ1y8M3bx36feJKNH+TEWPbxlKjcZp9cZq/rodhg64C0XBD2E4
         5UKuNmAqcym9uK0fEoNnjZVwlQV3B4bF/N35ifCmOoXUCHhVav9qx/D92NDzCmcOzupi
         6wGIOuVRDkB7O3Ray3OBZQ8QoJYRIVgbee9CE/znHRXYs7mUBP15hrMAwMtSCQigTu5j
         kihCvMyVBKdOzL/p8rfcx7mqC4TiE57gUKwOHfc0HRDgDzPktkmxKswEvd8rBA4ehCo/
         tEV2hBItWk3NqMeYcYck1Qty8fHCnV6PunEIcpKOITif5e4HuaY1uGayiHQwx0evFm5d
         +37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        fh=kJYa781K3fgDEjLoNouCWreL1G4BBV+uI8a55TEPqRM=;
        b=Rp81PIY45QXFNr92+JmATenLFpC7JikLMbervLyjuOQz3qs8I8uLF22+5stesBl0l5
         GV6AotyZtg8KD8/6ktXv3vHJEwMbhvmZz6aVqMX+3yQRZG6crj70ewiGd89SVjD3bxKW
         e9+F+P6rVVeaPUM0Hk+Xb4rlJj0k4ZOjVKMoxVotoTzuySfXIN78VJW75TuWO5D7ZC38
         2lEqb83eHDzzsx+ZxIXVzrhzOm71v3xqWyPd3fh+dYzJoov4yYmyj+KgxnL4pL1/AVjJ
         gUrNNrnGmsYIFJmVwPbxTapNkBtRXXFGDn/7MVm30aYfFwKw52hqQMlYJHCs79ji8p5B
         T/CQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794538508; x=1795143308; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=InmTmHUifgrsK1Dw1Ff1HKu8wlt8kS4ZUUMo2quMLqsfbLyFgsDnNoTOJOzu0N7JM/
         A4YXIp0jugQyKZLmb/8adbL5RFBWMBKYrAp/VIqYJCJFv7+oYE0UN/372lDJN3UzUFjR
         v9R0vLM5G9fIAJaqF4TsdjHT5gOgRQv3GqfvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538508; x=1795143308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww5MKM6poDK+IczcuuMJkcSdFtjq/phga8CrflKC7U4=;
        b=zy4uvrJs4smjN5EutR6S4ZqDZ2xtPCG7AvxyAcS0dKAzACTv69/sYl07FElv/U9ppN
         IFmXUIoyoU+qdOr2cOdorT1VXJKlDTg961fRc9wFtG56P6FxjvhUiybaq0jWyOoaKdbH
         9H/0l9Trj0cXrtQ7kmfmEzN8SpRa9JVzTC0XNrJOQeI41BnRfpLYeCRfh47qYCRrxCvS
         rGhDplwnwftM8xr7/B0IadbQPgPxDMWvoL9HgCWyzAr5Ll4I1f3UV+fm7JnBCku0I37+
         Qf24aRcqgqb8EZO+8+5O4RtOQxt/G/qVpIiMCnUyTIaD9gthMpHDsFnMGrdWIndJcIdo
         HkPg==
X-Forwarded-Encrypted: i=1; AL+hErFbEiYeXpi4EjZCQFPu9H1ook4hRdIK4ADW8RF9Ajr55B2GxbohnVDrovaksvUf6pbjb4SpqIYgCU4v4lu5ISVB@lists.infradead.org
X-Gm-Message-State: APuU4Z86RzUa5CR+uXVK23tGxqM9sRpsGz4LPGr0ijfG5ZVRoREh1HdD
	GRm5a3ffWGaZ1jx+EP7FsNMzsWIWG/SiS+Bhii/qhHVuqPvATm2GqeaAbM8HUcW/PGgJKRGhXJA
	nziWK6KdU4mb5YfMQrf4CS9FLz2ZlDvFi8hKd9DcB
X-Gm-Gg: AYBFou1DZAXIM06evU9C2dXSW7YXsqmmBlsFZqWTI3OJ9OtWZN8PSQIuuTif9PLMLra
	o/lWePZqNtlTsOM1fs3Rlfcm4JBwV1Nm5m15uqbpMWsittU6va22Tg4hPJVdk2Mazazo8j0gijX
	f1rP4nsM8NFhzVwzUHbEGzVy9esv4RQ8VPtsV+ZSfLZdG7khOoF6qZkSdfH1CDZia+nKz74+dvX
	1BKn3I3TOmqsT+Pb06wMgG5+XSD3Z03+YOYZgxlYP6I43EjXFXOz3EFgFMXpFqhUhMu+Btd2Hft
	EXM+6KlPgTnESxoOj0uCBXyl7ecx/PKhPxMl+dCNq01YH7SZxOwmbSC21OMcgMi/T9D5//3EFDh
	Hd70jvaEvuYvPui2nVLWjVffagxiNI+KL5XjVqA==
X-Received: by 2002:a53:d5c2:0:b0:67c:7317:de93 with SMTP id
 956f58d0204a3-67d8976bb2cmr676238d50.91.1794538508154; Thu, 12 Nov 2026
 18:55:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.2.Ib692ddd35c1dbea1757d9b1db6c1c7e938fc4ea6@changeid>
 <20261028-rapid-daffodil-rat-0adc6a@quoll> <aulIoq2oVjJ3DVzL@google.com>
 <d4a430de-715a-4936-8adb-35ff57a52b5f@kernel.org> <avZkfg6WMlMzOxpn@google.com>
In-Reply-To: <avZkfg6WMlMzOxpn@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 Nov 2026 11:54:56 +0900
X-Gm-Features: AclHuK-84j9IBFkhrVUuvk8buFltZEjB8ro1aPwuBHaC_xvB0gZrSc9m2OIxmfE
Message-ID: <CAGXv+5G5z75HGP8nv_i_nwEeSd3qkvyL_h_MYzV_XPT9BpR4jg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: soc: google: Add Google Tensor CPM binding
To: Brian Norris <briannorris@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_185509_544847_95A46AF6 
X-CRM114-Status: GOOD (  13.99  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 11:48=E2=80=AFAM Brian Norris <briannorris@chromium=
.org> wrote:

[...]

> If I do keep these as literal firmware IDs: does that mean you'd prefer
> these not be in dt-bindings/? Many of them (especially the IRQ IDs
> you're pointing at) are not needed at all in the kernel side; they serve
> more as naming documentation than anything else. I can just inline them
> into the DTS. But I'd prefer having macro names for LPCM IDs and
> similar, as it vastly helps DTS readability.

I think Krzysztof said as much when we added macros for MediaTek pinctrl
numbers. They are just symbolic names for easier reference. OTOH a binding
is a contract between the device tree and the software implementation.
And if it's not a binding, then it doesn't belong in the bindings directory=
.

What MediaTek did was put the header files together with the .dts files.

Hope that helps.


ChenYu

