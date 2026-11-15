Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26CC606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 23:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d7dy5Pi8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KwAFL+4s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=; b=d7dy5Pi8A8WZaD
	f6a0eYoipvF0LN0+bQ0dsKPTI5f0j5j4GXKJhDOjYkEAfDkVTkXP5CJAssfAyKEjZuLYDKS1RT5NJ
	LTik2UWQcJ+Edxf9UqU2kuzJmFkssKLNBkMrzI3ioxnbyWHtfUImpui4G8QcO5z/Q3IcJFZoU9RD/
	FF4Oy+VZkjeBWBYJHoKY6WheuXXzmao2rqzTnAg0cqbVyGivd9mNlBSkF/KGFA5+sOoBN/dnBdLpc
	aI0dqYJEHteP57GorqjqFO6033yEDGcswIWr+0O46LRJXZ0EXoLa7CjlS0fEaXb6bqS1hYcAvqDal
	hjb1fjCvdT8mxLL6xQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjtb-00000000kpB-2nqa;
	Sun, 15 Nov 2026 23:44:27 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjtY-00000000koo-3sMM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 23:44:26 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so3329157e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 15:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794786263; cv=none;
        d=google.com; s=arc-20260327;
        b=OeSTQudZNsTRm+uMhhGYp19rvfie1GZkHR8FhVVuud3oCHo0nM86aL1ZDELxHG6BI/
         LOxLOcutVH999dQIFgiwh9IyuekUZdVsbnKVgoTgoE2BNdyp/qEMuAXWifVvrCu4QcB0
         MdBGhIH8u5zgkvJFukhJg9qfRGu16gVHslXdCkq7P+3IyNNJiYgNAHaQ5aNAaYxKYR6i
         nHZ28CaGAdhKwdgThmfYfqTlQkFhoyqLVMSCy2m4BsodKH4DFM1BC04soVbyUuC+PDX3
         dBJnGfWobksA2tRxbW7rliVC3KuirljtwV4WPzExsNoKHvQatfdB8jOvoJkA28gI56vK
         pdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        fh=qU+URx0mnOppIYwN4b6V5WwO1UIkb65ZCLUwdRK1ShI=;
        b=lmS+it304kDiPAlzCmisxpVwlzFvv+elEdPMiTsPIQ7AVcEQC0C6UKVGHZdTHBIS+q
         ldFs+tvRrplklS9XmLhUwPuOjUEEQQUKjldIgwbXvU6lcxWZ+hy896BGkaHtBlMsesMg
         +kTq2rHR9TUwNitDqxqeh2CEPC7IlEd7B92XoU05xq41rUWd2le0UBgxSjGEtYNzn/0O
         eI58jun4Mk95wITl8WZC+Vj1eR8tJtF7Neg04pQeiXgCmOGaQxqIRZ5Y2MMpu/L0AP1M
         GGR1Jv9t4YHdTasrinJ/48kJcAg27EnKpGdPp9t1Vt/ARs4fsw+V1kaPekt+HPOAXC+Q
         Xk5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794786263; x=1795391063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        b=KwAFL+4srR/w1foHwt8FPW+CypdyGgsHpHwN6U1m6L52DmWtCC3RWDD/lmes78OTqU
         /nClWhoOhkv35HUts0v8GwVg/RpwL2gg99V6Ux7zJsobq3w4RfZDl9VRsvC8f8JI7RwS
         nfpp71RvpXYWUWuL2B57cHFbTS9XllDPj49+N6MiZKBVDXy6NLyBuMhnLJJfJqay4ren
         eKTQyrLZWGOXCn4RAIhSiIpnJq48D4FA67QHSEDYg4b4KAKOrGxBFHwozk6wmYO9PV5t
         P/qdBOhLGArmg76a5PjJecv7TG3LLRTIIcVg2aC+zApwPvuCdshZ54T1S7VtY4Nvxztu
         riUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794786263; x=1795391063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        b=VmUgNaxXRRzpLABTGVv37i8pkH6GwHcMYvMYzOcW8bqgIf3/Ov+KQI1IALSdZKa+TM
         DfUkE7Y7gkOp2XugLUNdRL0SOCs807KJdKmU4Bl9eC3IPziXS/VL32odCY6lFQ7CQxzw
         3KNmLn3CoF/GnwgHoP1or7oyrbSHNqeQ0oRZ1z2vK4oaS8FOXS4zJ7PA9zr3xQaOlSeF
         yp8Eq/4dyadSkS1+HSd+MtLdauvUJufFdSJAUHkwWoRr8zRtSKMtH2pGrhRkV0jDNDlq
         pd0ZNocz24B9Jd7YusI2kUCW7LMPJpXBiiISECZkAlPJhTva0g9yY3SPxXJXmuILaJoO
         0Xjg==
X-Forwarded-Encrypted: i=1; AL+hErH9IxQwwR1Jp3OGmKFqRlD2pyyCUmY1YlWM1iIhvX/EiGzf4UcGQtEqJvvxkV+fEt/OIdn7EjnuBUk/a1KERu4l@lists.infradead.org
X-Gm-Message-State: APuU4Z+USVQqhXDD4+06JUTrV7u9fy0s4spWbIBqLBXZyi3QfCHjI6px
	2Gy0ZMA5ugJTdhjCwGuXFMj4v6bk1lZTt4yS7bGT+sHqaWYqNCX19FWr2VuRwIbUE3rpbkXP/ha
	FNafDQBy7j0mBkxRAilyK2omxfkAbBCc=
X-Gm-Gg: AYBFou1mFs7DLZASe58Pb5j6ohrBFJIJzocFCfe8LexyolCbPkS8hyoEX2S5fUgs/Ki
	b2od/yQJKZsYnaqnF2tVa0HhOwAkPwcg3iv2ojrpRhgGMgaNE7NWIiDeeqNyHOSAvMdEwr1aqey
	jQVm2EqgVSX3VPqu7OBZ11lgTD0hheptULJWzgoRSfUypiRDSYkR1xKM9MBcjqb4fH2rDyp+0U6
	8JTxyq1ScLxyqpr6Kd0ZocT/8CsWfEeSrsCJ6gg4vHGKWaleToiIQCZiJrKwDnCnYwLwzPofqhb
	XFUTmRdaOseKUW9JX1zVME7oXzIVuo43sTA/OrTJpc7g6Vq+pYCUOxRfwKuN5o7im2oqruSC8Vv
	WwG1ZAvoj808EzUbiGRaoNSZz+J03y7LhHhfZzuT4FysbWfaB4+6tJIAIbcqnXAeahXumcw==
X-Received: by 2002:a05:6122:488e:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee34a46807mr3122166e0c.8.1794786263045; Sun, 15 Nov 2026
 15:44:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com> <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
In-Reply-To: <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Sun, 15 Nov 2026 16:44:12 -0700
X-Gm-Features: AclHuK_c04QdNpovv9zvqchoEQGN-Z-QnqhIaD68AYr5MCT9q1wPyZvYN5agNtE
Message-ID: <CAH87RzQRJB7yndzT4fAsQX4mV5h8Q8ksiwY2ruc_zUus8e+yHQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_154425_001122_A710E968 
X-CRM114-Status: GOOD (  21.42  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chen-Yu,

On Sun, Nov 15, 2026 at 3:00=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
> <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> >
> > Continue Jernej Skrabec's April 2025 series, adding the board compatibl=
e
> > and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> >
> > Board testing passed SD/eMMC reads, both LEDs at drive strength 10,
> > and five Ethernet interface cycles plus three MAC driver rebinds.
> > Each network cycle reached 1 Gbps/full duplex, obtained DHCP and passed
> > ping; PHY ID and 125 MHz clock-output configuration were read back.
> > eMMC DDR52 at 50 MHz and HS200 at 150 MHz each passed 768 MiB of direct
> > reads and 256 MiB of patterned writes with verified readbacks and data
> > restoration. All reported MMC error counters were zero. Both board DTBs
> > compile and pass schema checks.
> >
> > Codex assisted with DTS updates, review analysis and build checks;
> > Cristian performed the board tests.
> >
> > ---
> > Changes in v3:
> > - Keep green as power and red as status, matching Armbian LTS roles;
> >   default green on and red off without a boot-stage sequence.
>
> The roles should match the schematics, as the hardware vendor specified.

Agreed. v4 now inherits red PL4 as power/on and green PL7 as
status/off from sun50i-h6-orangepi.dtsi, matching the schematic. I have
removed the Armbian-based rationale from the current revision description.

>
> > - Select drive strength 10 on PL4 and PL7 with per-LED pinctrl states.
> > - Move PHY reset to the MDIO bus, before discovery and outside detach.
> > - Specify the YT8531C PHY ID; MAC rebind fails with early autodetection=
.
>
> Why do you need the PHY ID if you moved the PHY reset up to the bus level
>
> ChenYu

I have dropped the explicit PHY ID in v4. Generic discovery now
passes five interface cycles and three MAC unbind/rebind cycles, both with
and without temporary PHY-ID logging. Each run reached 1 Gbps/full duplex,
obtained DHCP in all eight cycles and passed 24/24 pings. The initial ID
reads matched 4f51:e91b, and the configured 125 MHz output was retained.

>
> > - Enable 1.8 V eMMC DDR52 and HS200 after board testing; retain the
> >   existing H6 maximum frequency of 150 MHz.
> > - Shorten the descriptions and update validation status.
> > - Link to v2: https://lore.kernel.org/all/20261022-sunxi-orangepi-3-lts=
-v2-0-70b899252c6a@gmail.com/
> >
> > ---
> > Jernej Skrabec (2):
> >       dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
> >       arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
> >
> >  Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++++=
++++++++
> >  3 files changed, 385 insertions(+)
> > ---
> > base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
> > change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed
> >
> > Best regards,
> > --
> > Cristian Filipescu <filipescu.cristian@gmail.com>
> >
> >



Regards,
Cristian Filipescu
------------------------------------

