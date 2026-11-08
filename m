Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B145606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hj6cR4Xa;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUA7Fx6S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xepa8tn8s6xYKIcCXkAtbeV099R6rMyX0LFl53/KC/E=; b=hj6cR4XauHklw+
	EVa5CO/xJP42GA2oiuG6QHU+HgRvcyWgj0Twz9Z2mMp6eD8MM6rmHxJD+UCh47LEm5SfTDph950Li
	g6xtngxwNcuXDVPqo19Mj45X4rlTCPUUVUz4Oo7SXScx9MQDlzwis3+xmrljDDHyfMeXljaKYS1kL
	6eUHiDpYb0eIcxGlkQVr3AbW8baox5dJgipBM2/vPH+y5lSb55wJtX7U3pGWpKvwJ2g76uoYbXZ5n
	YwKqFSeufqzjQHul+r5m6QnM7VYCaoCrK8sG87kocdddFmHwOp4vTRjZFckK+XCy7OFYgTv28+Tj8
	yyvRJgvEqXaSbEX1vuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4VD-0000000GIBM-1fHt;
	Sun, 08 Nov 2026 15:08:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4VC-0000000GIBF-1xZc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:08:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E478260120
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 15:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9281F008A2
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794150493;
	bh=xepa8tn8s6xYKIcCXkAtbeV099R6rMyX0LFl53/KC/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bUA7Fx6SXQ/qIpjRLIe+KpELT9LX2LUHXZty7YutCGmNbpqDXtsKVBT1IdLqo9AbI
	 CjiPTexhuiNJ8q+G7bDuLG/FR6UJYwZ3EIPI2+tBPwzf32gokvtcMevx4avBabbHyq
	 Bd2QHs4zODUpCjlFqDYtCK1FX/3PC0I/SWdgvJNQkJe4kXfca6o6vKcGBbIWw+FGMr
	 /7xhn8VrwYbzE3gIw/gSF5xzM74SdJiHjodlR6419aVjOHdyLHXCpRcM2vyekdOADE
	 p8sQpXkMPloLm8K6najfi99p/9lvFqtOo5GE+MTBGyjUkkhGvHUi8QGJLvnJrvAveQ
	 wWoMDdk5hjjzA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfe77d336so664111fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 07:08:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGKgAzxX5fUxl34y2d1HYK6ZhjH5ToHo89o1y4Rzj1ACFBb822Bv2IFUY3PjMVwH4l2y78UbJ3JRDnacms7sLSW@lists.infradead.org
X-Gm-Message-State: APuU4Z9CBqQ6/jIIJSQjDaRBf8BXyugrT7fx1ztYpWeWhSX5BNbgtyz6
	16hdYbr7E7cNcdJJTP1bDNfZk2DdDPeUXHVNKuQ7b0S4KcWSJqMc+Uk52+7ij1ofQBJukvvPRVb
	NaIVbI5FrrjeCV9ACPZfc3klzh17wfjk=
X-Received: by 2002:a05:651c:4182:b0:3ab:2d6a:1a18 with SMTP id
 38308e7fff4ca-3adfa3f5a5dmr3237561fa.10.1794150492428; Sun, 08 Nov 2026
 07:08:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-b4-arm64-teo-defconfig-v1-1-5e3763385f89@kernel.org> <50f2a108-0963-426a-a6c9-06f863f9de48@kernel.org>
In-Reply-To: <50f2a108-0963-426a-a6c9-06f863f9de48@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 16:08:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLmzYo4CxcMGDooBOxPcs0Jx-HUv_UGOkh1mkuVKRgKuqg@mail.gmail.com>
X-Gm-Features: AclHuK-65FZNd5SjWhlAKT5BS26Rt4g9KDFZj_La0kuV-nLr8RPhoN2XPwANDxE
Message-ID: <CAD++jLmzYo4CxcMGDooBOxPcs0Jx-HUv_UGOkh1mkuVKRgKuqg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the TEO cpuidle governor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 6, 2026 at 10:15=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 06/11/2026 09:48, Linus Walleij wrote:
> > The TEO governor introduced in commit b26bf6ab716f ("cpuidle: New
> > timer events oriented governor for tickless systems") takes a different
> > approach to idle-state prediction from menu. The governor gives a
> > better behaviour than the current default for tickless idle systems,
> > and for the multi-platform configs that enable tickless idle, this
> > should be the default governor.
> >
> > The arm64 defconfig enables NO_HZ_IDLE and ACPI, which enables
> > CPU_IDLE. Selecting CPU_IDLE_GOV_TEO suppresses Kconfig's automatic
> > menu selection, making TEO the default governor for this tickless
> > configuration.
> >
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > ---
> > Prepared with OpenAI Codex assistance.
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
>
> All three defconfigs could be one patch, honestly.

I've been smacked on the fingers before for modifying arm64
and arm defconfigs by different patches in the same branch even.

But maybe I should be more daring. I'll squash the ARM32
defconfig change into one in the pull request at least.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks!

Linus Walleij

