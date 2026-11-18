Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796E2606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F1b3FMjG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkAj02s+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jkc5vxUell4DJGLRsmUzNdnS1FjaSDbl1xaX6eVk0/g=; b=F1b3FMjGYtr7Nt
	cPdnvMI3BOq1e6gu//BR2CtLrHnI/6nBLW/p3QoDO4nYUiz1c/keyvQzR4uegzmbU/TsKC8F8J0mU
	f7AhYssix+VFlMLOs4NRf0i6k5D03b1Ya5PMmAQilWi5aLAZ1fw10OvhmbOoc6TdI+ezSTtJQcQV6
	13HtXz+Z9ULvaf8ESU4lTe15VAjUQ7QJP0t8pH4HqjWeZ0g/T7Jg267js6ES/bvLq8h0xtkbufhCs
	xQX911LIhbCoCvFJYgiY8ei2IvLPx4gRXiWkX8UPoFyhtXcgNIlY4u9+AcFH54LAhZBhxS/Rn6YMt
	1Buyt5Vtgds/rVvKxmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfRJ-00000008vQU-3yfi;
	Wed, 18 Nov 2026 13:11:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfRI-00000008vQK-1do8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:11:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AFD04604B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123E71F000D1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007464;
	bh=Jkc5vxUell4DJGLRsmUzNdnS1FjaSDbl1xaX6eVk0/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TkAj02s+lgjnpJuRM4doMFA9llt7oJYX8EFWS01/Ctr6hGS/avaTz9nhD4IZ6zYLt
	 53j5nt55FHJmR3HXkQcGwS1ulLQceDBXFQI3mLOfQHVXQtgSq7p3WV+gfFMQ6aFaGC
	 16uYJ3bZth43q6BIBzrVwrLAeSMVwhs2qcxrsWmNaD9ri+5mSVkmQZrMZ0ctsaBY6Q
	 qO5AkGrAWmr01HuCzom0w5HRb/Bw4/xb3B671vTPjLn9JRAmEWjkYKAGhY12lD784l
	 E8EtGUQ1viQy0OeB0wHmzY4TTyXSLbCHtzQCYgLZ38NeovqaQWWpbc+hWnR8KCBtlX
	 DQ5LdTSiBXv2w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so1025703e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 05:11:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFk2qzg4VeR3SinPcQmfwurH792B7iUOlCU50yKOSLFbK99D4ehiXRx2YaqwsvKxRbRqODT76kkB8Vm6Q7+wEHR@lists.infradead.org
X-Gm-Message-State: APuU4Z8LC8F+2CgynVyi2h3Cmf5G2HhJLLZZEODEFylHhApPfmQuND08
	cq9knjCT9EARqbbAKlNRDHEPlEsJN0zJkE6G3B4YYGkBFdgWa9DziZHoLO0e5UjDtIt61yP5PYe
	HHGK2KUaV8pZY5pUi+FPgSRWIOMibcmw=
X-Received: by 2002:a05:6512:6602:b0:5c1:ac60:3c65 with SMTP id
 2adb3069b0e04-5c1ac603de3mr550322e87.21.1795007462779; Wed, 18 Nov 2026
 05:11:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118103644.1360527-1-antonio.borneo@foss.st.com>
In-Reply-To: <20261118103644.1360527-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 14:10:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLntCeQ3Vf_wyZ4XO29qK+af18O9vGKEZK5SeTAiYwq8AQ@mail.gmail.com>
X-Gm-Features: Aa3M54onU98M5wFucsM5k6yOBsRr8-I0B7BdMRpixqeyddiCAypU8y2RbjyUO8Q
Message-ID: <CAD++jLntCeQ3Vf_wyZ4XO29qK+af18O9vGKEZK5SeTAiYwq8AQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable ARM_SMC_WATCHDOG
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	"Kevin Hilman (TI)" <khilman@baylibre.com>, Eric Biggers <ebiggers@kernel.org>, 
	Parvathi Pudi <parvathi@couthit.com>, Andreas Kemnade <andreas@kemnade.info>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:36=E2=80=AFAM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> On platforms STM32MP1xx the trusted firmware starts the watchdog
> IWDG1 as secure watchdog.
> On such platforms the kernel configured with multi_v7_defconfig
> needs ARM_SMC_WATCHDOG to ping the watchdog and prevent a reset
> during kernel boot.
>
> Enable the driver as module in multi_v7_defconfig.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

