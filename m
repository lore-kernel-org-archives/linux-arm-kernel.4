Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ACB606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P9jAC9Uf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YqOyLeJF1LZn52GyfM0b3GDfTRLm5jSkYKCfEBCotc0=; b=P9jAC9Uf3z9fID
	pAmQetjrRYGUzM7vRNHJQXlEwTIWLmsu6YbZwsWdp6sWZTVI2YvA1GBsXane4XaiznzVLzcKk22WN
	rlHCcdlEk7h1M1OFy7khwVezMWJwvcgHXlE9zeKL9b9TGN5osh7F6wBWedILJ8D+r4R+NFE1b8mYm
	OUK2v4Vy47RVnUTN140aAaJ7wtxACxVmDtnGiB/giwxFkXQVD0AACW/DP8PEeTKkIWVMNqjLZ3Ivy
	9Fb/d/m0THsRR7vGMebKb9i1VDljc+zq5nEQuRarraovMezyS23Nzd4JknvuWyYu2Pun1IBZnjNyL
	Ch8+4eKlJxxlUF20MlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy4g-0000000ESZ9-0pqv;
	Fri, 13 Nov 2026 20:40:42 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy4Y-0000000ESXc-22Cb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:40:36 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df0b02fe91so2582920eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602433; x=1795207233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqOyLeJF1LZn52GyfM0b3GDfTRLm5jSkYKCfEBCotc0=;
        b=DRLN7+CRdxy+Y++jYjBjjWu1xgVcOXKYru4We8QSE43PhGMmAmM81rsMlMlSVfsSgw
         gYPjnGPuUucfX3qgWqe/1mYNPtQXrEa608UnLfu5BJ0VAJ43FzZpcTKqBQDQa3yQVvtv
         xcYWJqsV9bhFuPUGgvnH74kg+pIg/tO8zFR4ZPTl1zJKVpzYBKJCKbjvDg7F02PhLieA
         tiC3OBCnXQc5Zmcu8BJKzeO9eL9lfEiv3GykNMjGTiarajzOr+EIt8Qa6vW+/3TQp/CW
         LGDz5aEIs9qzeiCTP1GTqZAi4MVMv+AP73ZHRsV10Lgt23Kb0LDwIfIttGKwtxEvWZUv
         7kAA==
X-Forwarded-Encrypted: i=1; AL+hErHuVt/rByKexQ1XsyJkW/TGjMm4xdt8HqJFZYurQVLabm3FTyO2LdU6/H5owXrXgz/J5Fd1kq81bUh4kLoHNdFy@lists.infradead.org
X-Gm-Message-State: APuU4Z/yVNroOFYZ/jaDZF+A+A9/DAFdRh7jx+oTRxOVmIwUiV0A9+mM
	b11CXK8Ig7j8yZHWKABZKwWcFeF/arPiiwlZH+ajgRv029H3Z3iFwyoI0Aks3PCX
X-Gm-Gg: AYBFou1Hw7lKTMWv5izj19TIuRbHM8HsyGBLq2NOikxuqPOC6F2rse2dl8NSG+oZLLT
	euugkLzZwBMQdSI9M4yGwUTJJ0R3dJlGupYJKwUVilaCjd5btJ59ovuTGXTE5DinZD7C3bZP5Fv
	Ec/ZVCTkZzY5efElsjzlAZYne8XwqS5jQx3aX/8SEL9VnY6JbB3mMaonKCvzi9vP2zs89s/lJL8
	WuTD7B75EKpblANnWakVSUUl4yOLco9J1KJ8sQYqcHdEro4IVdhcn2ebPCkX6QZ9jtHqBGxjj/F
	OTS6VLYZXBwZvGFnZszJbIdl4udM1xvx9txthGXHQtRhT/3rOBnr7B0Vu6sUSqt6LlnGu6k650Z
	i8UwAy+biaNLB/Ld5oljUbvBLMypl3IYSim9/g2/i9EyvC26Q8LcMXmzh+6Rpy5sHYuw+Z1op3C
	k3p4xVQHnRP2G+16qSbtaSCclenVL9+YdbSN7GXcI0cLr6Y76EiNeLJV5uL9R0qqywbmAxta1eQ
	/nUz+YaKD7YMJqZXXiucYibIrqr8shQ6z7twvYxcktTQemv6Zow9EFTFv5y4CldD5FKAWxMDSmZ
	BV9Lxd9c2CV1glj0TOtOqTj3OFHKoR9eLqY03K2b0o7cSe6j1wvlqvGiS4DerWmBK5NLp6P0jrk
	J8Qv9Z5Ux2BOy4Hgi1D5cHSz/ARkbx5ai4ZMFiFC6LYm0RjgWrQ2KjUGgUfT9ST/QQJqT3uxTzY
	xN
X-Received: by 2002:a05:6820:1518:b0:6d9:8fed:b730 with SMTP id 006d021491bc7-71ab4d85864mr1866176eaf.6.1794602432901;
        Fri, 13 Nov 2026 12:40:32 -0800 (PST)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm2548214eaf.0.2026.11.13.12.40.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:40:32 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-84e513877a3so2130404a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:40:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGx2dFflZ0Xnxq4h4vu8Iw+sKtsb4Sr7hTVdVgHLTWB34sU6t/GQaD6FxwI8YMwtHbUiH7VQAUScFWIx/OWWOUB@lists.infradead.org
X-Received: by 2002:a05:6830:1cc2:b0:7f9:555:1df0 with SMTP id
 46e09a7af769-86289878845mr2035460a34.12.1794602431926; Fri, 13 Nov 2026
 12:40:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
In-Reply-To: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 13 Nov 2026 15:39:55 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9ffh8v9PKn-pRc7DLjD0h9oP64ZB_FR5B0K=YfctJx2w@mail.gmail.com>
X-Gm-Features: AclHuK99xhj_lrjZso--3IknqiDF9swsBuRbZJPQdiHng0qFnjGS4Y8OcMsuew0
Message-ID: <CAEg-Je9ffh8v9PKn-pRc7DLjD0h9oP64ZB_FR5B0K=YfctJx2w@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Add support for Apple Silicon DockChannel internal keyboards
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_124034_552873_431C8B95 
X-CRM114-Status: GOOD (  28.44  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 8, 2026 at 2:25=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> This series introduces support for the internal keyboards on Apple
> Silicon M2 and M3 MacBook models.
>
> On these platforms, built-in input devices are managed by a dedicated
> coprocessor running an RTKit-based operating system. Communication
> between this coprocessor and the main processor is carried out over a
> low-latency hardware byte FIFO interface called DockChannel.
>
> To support this input path, the series introduces a few new components:
> - An apple-dockchannel mailbox driver to handle the low-level
>   byte-stream FIFO.
> - A DockChannel HID transport driver (apple-hid) that boots the
>   coprocessor using the RTKit framework and encapsulates the HID
>   protocol over the mailbox.
> - Minor additions to the apple-rtkit and hid-apple drivers to support
>   the TraceKit endpoint and integrate the keyboards into the existing
>   input-quirks framework.
> - Devicetree bindings and DTS updates to describe the nodes on M2 and
>   M3 laptops.
>
> The transport driver is based on an original out-of-tree implementation
> by Hector Martin, but it has been significantly rewritten for upstream
> inclusion to use the standard Linux mailbox framework and align better
> with upstream HID design patterns and reduce reliance on hacks.
>
> While the coprocessor manages both the keyboard and the trackpad, this
> series only enables keyboard support. The keyboard can be initialised
> without loading external firmware, whereas the trackpad requires
> firmware. Trackpad support will be submitted in a subsequent series
> once these base transport layers are established.
>
> Tested on: MacBook Air M3 (J613).
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
>
> Changes in v5:
> - Link to v4: https://lore.kernel.org/all/20260925-apple-mtp-keyboard-fin=
al-v4-0-304c267518f4@gmail.com/
> - Drop ASC mailbox and DART binding patches which were picked up and are =
in apple-soc/dt-7.5
> - Simplify HID transport reg-names from coproc-asc/sram to asc/sram (sugg=
ested by Rob Herring).
> - Replace the empty STM child node with the 'apple,has-stm' boolean prope=
rty (suggested by Rob Herring).
> - Drop the keyboard child node and move 'hid-country-code' to the parent =
node (suggested by Rob Herring).
> - Simplify the transport driver to filter supported interfaces in C and d=
rop fwnode handling.
> - Collect Reviewed-by from Rob Herring on the DockChannel mailbox binding=
.
> - Rebase on v7.4-rc1
>
> Changes in v4:
> - Link to v3: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-fin=
al-v3-0-e356464e454b@gmail.com/
> - Describe the DockChannel interrupt pair in DT (suggested by Yureka Lili=
an).
> - Serialize command transactions and finish STM setup before signalling r=
eady.
> - Keep IRQ flag reads and acknowledgements under the controller lock.
> - Clarify teardown synchronization and use the explicit-bounds HID API.
> - Preserve interface-start errors and allow waiting again for delayed rea=
diness.
> - Simplify FIFO writes, IRQ startup and compatible matching.
> - The command and IRQ changes address Sashiko feedback.
>
> Changes in v3:
> - Link to v2: https://lore.kernel.org/all/20260918-apple-mtp-keyboard-fin=
al-v2-0-a5c685e50b60@gmail.com/
> - Fix failed-probe cleanup and interface publication ordering.
> - Fix report lengths/types and reject replacement descriptors.
> - Terminate serial replies and encode checksums as little endian.
> - Honor HID_QUIRK_IGNORE_SPECIAL_DRIVER.
> - Clarify the DockChannel TX byte register layout.
> - All changes above address Sashiko feedback.
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/asahi/20260630-apple-mtp-keyboard-f=
inal-v1-0-506d936a1707@gmail.com/
> - Rebase onto latest upstream and add M3 Pro/Max device-tree support.
> - Use an optional STM node to decide whether to wait for device IDs
>   (suggested by Yureka Lilian).
> - Rename bindings to match the t8112 fallback (suggested by Conor Dooley)=
.
> - Fix FIFO MMIO write width (suggested by Yureka Lilian) and run mailbox
>   interrupt handling in the IRQ thread.
> - Remove the duplicate report fixup (suggested by Sasha Finkelstein)
>   and redundant HID dependency (suggested by Julian Braha).
> - Fix teardown and the missing HID stop callback; simplify interface look=
up.
>
> ---
> Michael Reeves (7):
>       dt-bindings: mailbox: apple: Add DockChannel mailbox
>       dt-bindings: input: apple: Add DockChannel HID transport
>       mailbox: apple: Add DockChannel FIFO controller
>       HID: apple: Add support for DockChannel HID keyboards
>       HID: apple: Add DockChannel HID transport driver
>       arm64: dts: apple: Add MTP DockChannel HID nodes
>       arm64: dts: apple: Enable DockChannel HID on M2 and M3 laptops
>
> Sasha Finkelstein (1):
>       soc: apple: rtkit: Add tracekit endpoint
>
>  .../input/apple,t8112-dockchannel-hid.yaml         |   92 ++
>  .../bindings/mailbox/apple,t8112-dockchannel.yaml  |   88 ++
>  MAINTAINERS                                        |    5 +
>  arch/arm64/boot/dts/apple/t602x-die0.dtsi          |   47 +
>  arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi     |   24 +
>  arch/arm64/boot/dts/apple/t6030.dtsi               |   47 +
>  arch/arm64/boot/dts/apple/t6031-die0.dtsi          |   47 +
>  arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   19 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8112-j415.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |   21 +-
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   47 +
>  arch/arm64/boot/dts/apple/t8122-j504.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122-j613.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122-j615.dts           |   22 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |   48 +
>  drivers/hid/Kconfig                                |    2 +
>  drivers/hid/Makefile                               |    2 +
>  drivers/hid/dockchannel/Kconfig                    |   14 +
>  drivers/hid/dockchannel/Makefile                   |    3 +
>  drivers/hid/dockchannel/apple-hid.c                | 1167 ++++++++++++++=
++++++
>  drivers/hid/hid-apple.c                            |  118 +-
>  drivers/mailbox/Kconfig                            |   12 +
>  drivers/mailbox/Makefile                           |    2 +
>  drivers/mailbox/apple-dockchannel.c                |  357 ++++++
>  drivers/soc/apple/rtkit.c                          |    2 +
>  include/linux/hid.h                                |    1 +
>  include/linux/mailbox/apple-dockchannel.h          |   29 +
>  28 files changed, 2251 insertions(+), 47 deletions(-)
> ---
> base-commit: 1d368e025d7c4fe63c8bf68ccb4bc3c9772ab75c
> change-id: 20261108-b4-apple-mtp-keyboard-94f1cf08ef11
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

