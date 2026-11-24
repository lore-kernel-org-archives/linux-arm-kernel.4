Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B423606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jwsfXyQm;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wjGmiDj0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=; b=jwsfXyQm1e5hQhW+RBHnd/AHTy
	dlgKteJiWxeRRai4yJCfM9n9I6f7pZ4NayGgDSCWetwdcA4ocEh/huZfcokAgZ6Wd/MVnNn16HJfx
	AAJntNbNxGmZWBn6EkEfpWS+cwZCPMc6VURh9SFZ1D0SY7LOeHaq3iiwdUGeNqcbZtxwjVYDdgs+J
	ldBIXZa0X4C31bVaVZ7+8cG83Gu/nJzzXktzIz8iXCkxvAe3gtAhSt3udR/pb57p6iqfwexiZT+ek
	ombXRdF8h4XyfOrLyp4Cbmljhxp+RZv3WWhbHbl8w9/D0MMp6iDUW664KnCdZIusQWrmnTg/KKhe4
	TSfWTCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVz2v-00000007zup-0XA2;
	Tue, 24 Nov 2026 22:31:29 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVz2s-00000007ztw-0JsI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:31:27 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso5949363a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795559484; cv=none;
        d=google.com; s=arc-20260327;
        b=rk7NWlZoDXNKg4hV2tpb/usbmC6jvEc6lH1t1bVAsTbztVwdoHPA9SWPjK52NpBhxa
         VVEmnR1XEUtZsSwqNxKAfP6sgUaQYANZ1KQvFQ2zoVDgWNKiD9qkPFRlbm+Hv/l66Zm8
         IWbvNv4iuT2S4cHav6CZgD3Gs6JoPrN0wepPqibkHzKf5O/6uJ/NrPaNRC/yVuEkJS0V
         LMaL8Z/9aB3zMmYYTjJIMnZ/UMoDnXzIWWjVYFVZeLT6y4IVLL4V7PJlii+cqe6i98XO
         rY+zKDlCdXtqpuiteB0o+8STuIJpeB+NDGwaljjs/wwjtG2hlnC2SWMmZVW/IMeSbvBN
         D+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        fh=I43ngyX1Uo9vKC3spvx/BQY8Mkatx2wKt3EUIeDo0Ok=;
        b=OXTqp/JnX7v416j7wd/uogrhUTGnBvmepbTDsyxh+h1sNgXfv0tcFrmdPSnfRB+ljC
         zjDyLd1ch9uLWxGBOkiknKUvfhthufLOkMcjbJwop5Awog4Lau3lIgX8HpXC8nOnhDq4
         7GDfZsB2+yTpfwLT+JxTslRr8HCm1+QWA8+Zdr2G6HIJxU3n1wOMU8Uu1X7S8QdH9Ylv
         tqmmRkLQvxVzsHyRVay20/8PbEhVCLHsA4bi9sbqDeVQ/XVddbtjv3aHQ/VgWxZpQJmZ
         dywqdxoMfcLZKNxy6vDUWoV9yQHjNMPZHKdIZhUfBBm9h+aFEtCj7+e13+DrktcEzBdJ
         QXfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795559484; x=1796164284; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=wjGmiDj0iKGfCPLPuHgUvcNO77ViLGn4vIaJSREztIThxsjSMq2tNq9WuYfn8bcrUJ
         Q/uVCwIEZgrccY+NicfnhXRZFWKNqBYqCkUdXNuw7Qw6LfB81Dpv2ykxcDZAXlPXM4hu
         OgB5uIazDbUdNAwz195PXOkxBAo7qsjI5hgnV8vzvTSZSgiR2JsXSZBedrOlu09rW4VW
         WRpmUtMLfsIrqsmWjFUv7nfNXgD7gIzuCBj/EgFsNftTjU0amw1SReUXeFPEluR6zxeO
         ity6N5AYFp2Jel+Ee0voW39t8EibsVrBnuMbxULeHJy4i5ArUU6BRPRyszz6SiAvgVl2
         SKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559484; x=1796164284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INRxzK7vSn4HoWNw09mGrnkGOVMtgkPRDzZLhk0h1pY=;
        b=V3yGG+58JAfyM2hG47Inyte3t2NUyDzbs5sd5QvlukLpAABk+5j95k+3RB+vgZGRDC
         zklahdNwfX4RM5kj5BgfxFDQGmmV+2J3R2qOCSNna148OYwRhswCbonj3Fz+TENpcIyh
         deUFtD0LFZ5DKaKvfDJ8+Qt4dfNpwPj0MWjTg0rgSrA/3jxT3YV+Rt1B+VpZW1wd1seh
         3zsbjxt+KU8p5WBPj9pywTfbS2ASI1zk7e9PhSCY1nXz+uXE1x/qOAwb3ShvDLG6HBcj
         72UfB/mX21oHPl1mfW7SqT+k25+CF04Llr7kh3M7HJQa9IXqCHOdfuvJUSWYOmxJYIrj
         +jGA==
X-Forwarded-Encrypted: i=1; AL+hErG/HEokSrwN0OqGBpQnbZHB9lzda/optpO8stl7s8MaCsXfrRZbmI4UvDai8tt/ysX2UDd4zPJHci5KUp3RfEvn@lists.infradead.org
X-Gm-Message-State: APuU4Z8H7QnlM30dhK/nhCYYFy/5JLrA1nlLA3oFeH+TZbCyzDrTDtku
	epelntIPP22YnfjBI80wGPyCVH7UL2p+blRWdsKAPMOqQVAiqLnl8Zt5SDAhEj2F3BqIwLOkmSZ
	RxZa03DRbEIVc9aBw4Z+zqKnPCiDHmte4PIsKR//aMg==
X-Gm-Gg: AZFdTZdRwwcT621m772DwDjg1oPPeSsnUFmDbb20CE7uKCpqlzxz6CTwoGi/qv/5Sq2
	O9vqUqF6KI43guedWAmaoYSjE+P4K0EFOd3sBVe29pzC2qPYjEusKwzTIEwcbCVmhdYMtRh2ASM
	zkv5gg3xJzyM/s2xpX8IApSVD2J0E24lDb1UvOjfzthLjFnQw3WCLkfL2N0BRVNL6CKRYCyBGYF
	OwT3oH7g4rw8IyHmjVxgojzVsgZ8TgcPSa0pncV0rUhGc7/weCI+sLjSmq54fZfQT1f086gPc7o
	F/ja8/dYce8qet7DpV708k4+jc7iqSSkKiRG2k5c3WwNn6Ryo6njjSEzA/cw3ds8dLbIY300HvQ
	ncvBeq1Fr8JU4N6Rx2/ETjMR5V72RnkJp27AOMTxw105Pg8fOK0xrJ9zl8HRyYqHvr+ZJ8WNXzl
	S77CePyOyIgj/F9WUG
X-Received: by 2002:a05:6402:15d4:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6ba37ec031amr9043918a12.36.1795559484024; Tue, 24 Nov 2026
 14:31:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com> <awXf86suGgKeazZx@google.com>
In-Reply-To: <awXf86suGgKeazZx@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 22:31:11 +0000
X-Gm-Features: Aa3M54olM1DKVBX3EQP9Zt-gD9WnHLwb_Lxu-JjOzcrrRgxAqJXxzL4OnVB7R18
Message-ID: <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_143126_145782_E124A945 
X-CRM114-Status: GOOD (  20.26  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Brian,

On Tue, 24 Nov 2026 at 19:05, Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> > Hi Brian,
> >
> > Thanks for your series; it's great to see more Laguna support being posted.
> >
> > On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > The Central Power Manager (CPM) is a co-processor on the Google Tensor
> > > SoCs, as used on Pixel phones. CPM supports power-management and a
> > > number of other features.
> > >
> > > The Application Processor communicates with CPM over a pair of mailbox
> > > channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> > > reset, interrupt services, and more.
> >
> > [..]
> >
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +       tristate "Google Tensor CPM MailBox Array Interface"
> > +       depends on ARCH_GOOGLE || COMPILE_TEST
> > +       depends on MAILBOX
> >
> > Should we also have "depends on OF"?
>
> Why, precisely? It's not actually a compilation dependency (I tested),
> although it's needed at runtime. It doesn't seem like this is
> consistently done simply for runtime dependencies, and instead work has
> generally been done to ensure everything builds fine and fails closed
> without CONFIG_OF.
>
> Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.

I was thinking more if COMPILE_TEST=y && CONFIG_OF=n &&
CONFIG_WERROR=y is set. I'm not sure if 0-day performs such a build. I
guess since no 0-day failure has been reported in this thread, perhaps
it isn't required.

Peter

