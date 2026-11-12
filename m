Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA24C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qqTBG0e7;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BLeK8GL8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=; b=qqTBG0e7J0YtDD
	imtfM2yClBPOvjFf4kYEdMsqbkvVWKtbGLdiVns5JdzOtccPjgOPt2j6N2ewsNNSKvfD3itFnj8Hb
	Sf2Nu4fhtbIzVoOIoNYVvm3rldIMJevk/uAcYWIattPqt51ibLOAtwlTyvrKLi+rfw1o+NSQpgG2H
	13SvnlOVOeBtRW3rXf48kbsKMbrOy3HKmDREsFURrG/2Pq6cWGh2Gb5yl5O85dFsITMtZBOV4UXEP
	YBEgZSuRO/yzRJHhwE4eaVmikRzhz9SYxMznQF0TwzRZ8+0+e8SVAEgfNWPZ25sK3RxyBbHUMFKij
	BfPS5Ht0QqE7YxGNhtyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUoA-0000000A3sr-3e9p;
	Thu, 12 Nov 2026 13:25:42 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUo7-0000000A3oH-0lUY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:25:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso636219966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 05:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489937; cv=none;
        d=google.com; s=arc-20260327;
        b=U0r0m8LcqdxSXyPhvMJ2sDArHguq8nh6tSgsZQM0A/PXi7wFHbx2/FqTxh5ONz8Gj2
         9wGVQe+wYtJt/cJd/Mdrriv1ylW4HsPNzuq53KDXXLPFUGA48P9l/nF8JM1MmXXgIaDj
         mZuokOf1SmqsDRl68S8cEBaC8rFtzr1aJDZxNX86trsrTwJ5LDDSMY672R32m16GsxjN
         J3W+iXybmVG+pHRDNdRLy4WZae9slCiyuBglBrc+/Ikcyal75EnlOy8E7JB3fnEYQcPh
         gH3DkdKskg0SczKmcFv97K3prGgyDSJaA9gTIQ0WK1SB/1u5YrlAd4w00fGi3V6llUvx
         47eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
        fh=wHfCeDEXUD6uiUCKaxEFkmP8sVRlZT3abtPd03xLfgU=;
        b=FS3Xwk3Rz3uP4n7uEKQ1xsFsPSIvheGrAhys2cQDd+n5HV91Gft+n06r5pOftFTru+
         OHr5mltiA/zJ05u3m4l6/UcXxVjRuUoTHN+2IbL/zr9LgIFFuSgEW98K+fQGnYNQZPdy
         YJmd+ayoRtIKoIFq+VdiLF7x19nRdCbERztd3fL3hIW8JMpm+uMt0h3zzUiZQAeDiUtU
         H10QDDsSGB6Imcu8yCTBXv1VIS4ZFLnhDyl5USuJXqnO1g/lrybNEUsI+XPesdB+57R1
         o8XE+DCsgoqYQICsU0b0G2k7e9swEOFCCzBkBWxZCvM9oVWPCUpsxGIGMbTjDCpVCwf1
         I95Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794489937; x=1795094737; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
        b=BLeK8GL8jc3Iih2Ah1QREq6b9z6Id9iWxhBXi60lPBLeYVg++d9wZikn/JmrPIRyvq
         xGCpoBok8V4MJWHWKUe90FrPl5idjEWf7vLcY9Gf9ypn6xF21L315xnu6Bt5/IAbKXMi
         jpni4DwSX3E9qOqxifYQJeIrmdZafXoyqIIf39pQtkvGLaYza0k4dj3rfOw3eXRLV7Xg
         L1dwIVVWzvSq7Er/cyjBLFXBZL4+ZDN9mysW0m2nAdkokEuwbHapVcoW4OoWJnk7/boX
         olCw8xBMJI+kyKHmdCSDz5lt+Ychix4DNkL0ER7ALsAXUblomR7jQ+aKnC8515BQF5Ks
         xpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489937; x=1795094737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
        b=FrPm2hWM3BxqGad/UeUL1zqmZooWWg7qivmDI/GINlnR/mrG87y8nCJJxXruMTWTJR
         3r9cDtPEg5tfqXzNVYxYVeciFDvC7yWpC9EX4R0Q2xv7IyETTUXQNnm6IuNlhCpcVwy1
         kalGYMqjSejE8aTvXbhqY+Fx2bYXRFxkgFnGfxw44xR6R0NbNKeKMNMqy/vfI4LdE4sy
         tEFDJwXUAuNLDiLBUpjd9CfTJgKnzdSwGAujU4aoudKFnP+FF3lySZpSGd6y8cFVJZvL
         j8y/Id+jQh62SVLxa5PUqD3PCwErwL9P4fOeSYqNqMmkc2FVLoSlS5JAq6uFcHFG6u/J
         /CfQ==
X-Forwarded-Encrypted: i=1; AL+hErF5ZBuDAQgXDy5Az23BZb4VmVjQwdHlW1aFaAW5NyriwO9Mo8PQdYOO4ArafBY/s8Q2hYlsMmeI9CvelIsqcrU+@lists.infradead.org
X-Gm-Message-State: APuU4Z84Rrc03nzJYJjd+vYn+XezJZNk7JwhDYvww2aaYMJOzcSXrZiy
	Pe6vmZxy0uyAsIccWikkZQisAPzHk75MWYgmrJuKjYEKMwsGaSAcjmY5TkUHvomHlnwEtGT61ww
	g2dRZ4zKqX729zbMjIuVFuijGbbaBi/cTqu/s5dpiUg==
X-Gm-Gg: AYBFou19wBpqKVRbOLCSUE1IOBBKvFbkdn1EH5VcRZP8Qukgp53/c/eV5wDx2dOLhqV
	3yqeF4OW4eOVdRHpU4jKQ/AtbncrfAWOawadD6fun3z8aQmPeoG2B8Y6osDuebTesTzhbOpQcZT
	nIjhu72wwQ2k6g+mdx4avg+C3ng2NRO7JDpSfhOfbTDYAzWNTSwVvM4uhT+NiLjf3wOfdpx2J/t
	IeuwOP8U4fqPtFGVrnZhpzS/ZJJsn7rmZ7UTi59kPl9rQ59Ky0JztJBI6/Bp6ub/gFay8iGmn8x
	vwGh7OTUK127t6G5QUF/2upm6zKYfvN3pfXjT0hRY29ApuAlMHw4HkBTzS8KeJkT0F6JTIgOo2B
	jypcJIQeRiZtDeI/YlVOFP2OehvC4qj7dg2nP3bcUYyakRJtlvsXcxjjHYjLvbUcV7VQD
X-Received: by 2002:a17:906:4a8e:b0:c50:750a:6a1b with SMTP id
 a640c23a62f3a-c50750a6a81mr275760466b.29.1794489937376; Thu, 12 Nov 2026
 05:25:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
 <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com> <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
 <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
In-Reply-To: <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 17:25:26 +0400
X-Gm-Features: AclHuK-ae6rK5KLX865N1ZAAiK3m-L1yS3bWzPXEljeOEVs3lx4mmzdXwRyUZxQ
Message-ID: <CAKTNdwGHS5M4yNKEqfKV8hEJRAYf3wnY1Z6jOWQx7e4cipTF9A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576 EVB1
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052539_284163_64061B18 
X-CRM114-Status: GOOD (  25.96  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 5:01=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> Hi Alexey,
>
> On 11/11/2026 6:45 PM, Alexey Charkov wrote:
> > Hi Chaoyi,
> >
> > On Wed, Nov 11, 2026 at 1:31=E2=80=AFPM Chaoyi Chen <chaoyi.chen@rock-c=
hips.com> wrote:
> >>
> >> Hi Alexey,
> >>
> >> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
> >>> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 =
CC
> >>> controller and a fixed-voltage VBUS supply.
> >>>
> >>> Describe it in the device tree, including the wiring for both the USB=
 and
> >>> the DP side.
> >>>
> >>> This makes the data roles follow the Type-C port's negotiation, so th=
e
> >>> port stops being host only. It also leaves the VBUS regulator to be
> >>> managed by TCPM instead of being hardwired via the tangentially relat=
ed
> >>> phy-supply on a USB controller. DP lanes are also muxed dynamically b=
y
> >>> the USBDP PHY based on the Type-C port's negotiation, so the hacky fi=
xed
> >>> lane muxing also goes away.
> >>>
> >>
> >> Have you tested this? As far as I know, dw-dp driver does not support
> >> Type-C HPD yet.
> >
> > I did - it works fine for me under Linux with Sebastian's patches. My
> > primary motivation, however, was U-Boot, where the current phy-supply
> > hack breaks USB data role switching, due to VBUS being forced
> > always-on. With this patch it works, and now the DT actually describes
> > the hardware, as it is supposed to.
> >
>
> Oh, I almost forgot about that. I think it should be this patch series[0]=
, right?
>
> But I think we probably need more than just this series, because
> richtek,rt1711h does not register the HPD bridge, so we will get this:
>
> [   14.828983] auxiliary aux_bridge.aux_bridge.0: deferred probe pending:=
 aux_bridge.aux_bridge: failed to acquire drm_bridge
>
> Maybe you have already added the corresponding patch yourself?
> Another option is to use the generic AUX HPD patch[1]. :)
>
> [0]: https://lore.kernel.org/linux-rockchip/20260806-synopsys-dw-dp-impro=
vements-v11-0-0d508505f383@collabora.com/
> [1]: https://lore.kernel.org/all/20261020072816.180-1-kernel@airkyi.com/

Yes, on my daily-use branch [0] I've got a local commit enabling the
HPD bridge specifically for TCPCI (69b7c806b334). But that's all
driver territory, so out of scope for DT discussion ;-)

[0] https://github.com/flipperdevices/flipper-linux-kernel

Best regards,
Alexey

