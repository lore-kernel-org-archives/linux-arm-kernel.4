Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21B0606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xZNv3BwR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIOLzvXf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=; b=xZNv3BwRMN4jzj
	+X0DkUY4ICwnDhS/QrnOOQiY8K7mp5uksyzv589rs2fAmDaMrR2uc+W7XSWxl3TOl9/6nHOsOsD2x
	1msZjZ2HNJfDhQO+tcgiWhSdr25mTUISkx3ZmAAUKsN5VSFrtsmbu2GTuM2EMRwJ1UIHhlLpshiOr
	aXxXzc89dfquYF9SgJdKLNnrdDzYzVa07Pvopfz93QkIwsUhz2Wo+YR/SvfNtYqnVFXuDz1dXn3bj
	Lc13MARNKHszN7+Gpj9S64RMFW9Se7P9Fr7lBDLgMgclP1L+vNHkK3Y8eQsLekHxPku8QeZxoRChi
	gpsSySnQy5TAlSvhnZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXJN-00000004GMx-2THk;
	Mon, 23 Nov 2026 16:54:38 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXJK-00000004GML-2nZo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:54:36 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-5ee3e658c70so1038867e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452873; x=1796057673; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
        b=NIOLzvXfem5WrwKwmSPOdLbdSWrAoi86A6mntT0oTnoqehJu/ytR+WJDz2w2tWHJ8L
         e5o22mh5hf2h2iHu86obGPDgzNIzTlejwe/ASuIWNW6pPgEJF679Nt9j3EONvBx9YsgN
         QHy8c4F36GChaa1zQULN3uQ8v9LPO+Rk5w0wzbw11Cwb91ZUAsIYZGx7Djpn3bDoCzKD
         sibUGYsG54cK7hhO+3ehfSirB0zgO8oR+pZaf8Y2ZXsD4JF1MxvS899jdSvXePsujvuH
         5lFbf9pq4Wn1hAkPbXeMXKXSUUaxzfSmUQi4dQv2GOkd9251y864w6zy/up434Uthpkc
         QTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452873; x=1796057673;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRMha8kezy82Lb7FBCLkHRd6Bd/GNI0Qqhk8lamcaMQ=;
        b=rINPE+bVg4z9hcgadBkmuOfuPU2EYuZ9bDz/LK41vN/4yY3gH6B0yMicCD5MrYkheX
         dheltmfvUhD9qXitW7kDSsXproc+FpQTTMB7bUtT7J4QKah867ahmnNwuJOPoFS3fyjm
         o7Q1c1n1Zx4Wnlc5c/ot+dtKskw9f1r9RrIaGsn9VRj7Q8fwoSrF3myMNtARcoNsjUfT
         r7O2go8abJpLsu/PvfoMls2H3U+FEsww6WqCHGFRHmGyZC+mnKkDg6LIOZh94vM20hwG
         02OVH3/1kShkv3pWrg6LXQP+Vsey663X5OEizTCEsp5oPNJw+yjBMiXEk087sk6t9coE
         fpqQ==
X-Forwarded-Encrypted: i=1; AL+hErHHO0Y6gw9VSP1rc7UcbCXt5m9VaMrwqSR9K/EO/bu9AqiS0K+Gk8W4bMAUMzG+IXupe0005r0i586He3/4GY81@lists.infradead.org
X-Gm-Message-State: APuU4Z9/lq9zwx23Szhpqmf2WHb3+2RyouNM8FXgs3tr/LZ7nwm5xJAY
	WA6EEIVabY99ezq1BJDHzfJsdXjWEKivPpoG4/MvMXCZoxhBiGYfoupr
X-Gm-Gg: AZFdTZcRc4zirk5oYrOnDwVXZa+J/RAUuzhHU/jDHY+wVrUUGtAmeeAryHG3DtH743d
	yUMyqtvO3HYj0bkElwzsVdHrwKQmrzBSoQojyKatZtDsn5pp8sW24ktbd/n+hIR0I1DcHQRZADz
	9Yy0Mil46mAcBpN9r5ViUUsERI1GytEotco2bgTtCOVBrDLazqavJVXV+1X4nH/AIZsyb4ueIkn
	sF6awSvYacymDTqfk+rUsW+iN9JcxNIbZ6U2gPFhWKLUQtjQf8E3MMQbODBoEYUM5zzKArt05Ic
	9RIjI2Fp4zKOvKme60/ng13JxbpG5glCnF/vcyjS7Vb/tSKm2W+/wNzft6u2xQaHvlQWrEQzLk9
	gWxr7rCwWmPzw6bAjnKb/nE9s8wkq0GNjdlBBjpaeZ7t4L2t5I0s+hXw7n6jCF+V13L5SmbTyy2
	xW3a+/9bBIDodWO1fq8BiZA4ckRB2u8qJRkj9xpkfCVAWyJpruwAZGpG1+5S8xxZno9fY2cKZuh
	3esxygK2UNFfsGn0xuxPSQbhXWfgPNgDnDqDQL+gr9kDD7iES6nJyKK4Lj1sCgvAmJgqPaRsW4C
	3dV1Wj0mGgxGQ8C7XJPQYWrWQPBnEsdD7W99pWJN/KWr/QVablgoFnZhNPZFAnGb2w7zrGH9BzB
	9WkbXoHnHXaqOqJnpehPwXH76vkihjLouMZoQ
X-Received: by 2002:a05:6122:488e:b0:5ea:c120:4514 with SMTP id 71dfb90a1353d-5ee8af3457cmr6237914e0c.15.1795452873322;
        Mon, 23 Nov 2026 08:54:33 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa42:30d0:88c6:e1ab:a806:9c3d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b5a8fd3sm11386824e0c.8.2026.11.23.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:54:32 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Mon, 23 Nov 2026 13:54:15 -0300
Message-ID: <20261123165415.69710-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com> <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com> <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_085434_713053_28613D35 
X-CRM114-Status: GOOD (  14.06  )
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

On Mon, Nov 23, 2026 at 1:11 PM Andre Przywara <andre.przywara@arm.com> wrote:
> I wonder if this works anyway with using both the internal pull-down and
> potentially external pull-up resistors? As one would win over the other?
> Can you try how your board behaves with:
>          cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;

Tried it on my v1.11 and it doesn't work: card removal is detected, but
reinsertion isn't. PF6 stays low with the card in, in every attempt (two
DTBs), although it read high at boot with the card already in.

Neither one wins cleanly. The A733 datasheet gives PF6 a 15k typical
internal pull (9k to 21k), so with R59 (10k) the pull-down leaves it at
roughly 1.6 to 2.2 V, below the VIH minimum of 0.7*VCC (2.3 V). That's
my math, I didn't measure it.

I then tried GPIO_PULL_UP and GPIO_PULL_DISABLE. Both work: three
complete hotplug cycles each, plus booting without a card and inserting
it later. With no flag it also works, but only because U-Boot sets the
pull-up (sunxi_mmc.c requests the CD GPIO with GPIOD_PULL_UP in the
2026.01-rc1 tree I use). To check that Linux applies the flag itself, I
forced the pull register to pull-down in U-Boot before booti, and Linux
wrote pull-up back.

Could you try PULL_UP and PULL_DISABLE on your v1.10, card in and out?
"grep 'pin 166' /sys/kernel/debug/pinctrl/*/pinconf-pins" shows the bias
Linux applied. If PULL_UP works there too, one DT can carry it. If not,
I'd add a small v1.10 .dts that includes the v1.11 one.

Thanks,
Vinicius

