Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948E606B11B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NUwoLlXZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TeFh1mZy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nZMLjQOnKSLNJDPbXg8WmoUPbegfRsFLvgEFn2RPTRY=; b=NUwoLlXZJJGkRA
	OHfhPnA60L2PS6v5XgSTotQzIChKITleF5mBbNAqv6SM0oprlU7U34bvziWAD3C1AiZYIMa4ysqzb
	r6xEFd45ju9XkP75Zvm7iEjyuF9y9MqQ40yySBykWIodZHB8jiMGg++vvJRCuJJZc7hyVWCBtj9SZ
	134kZNowFrSvLYaZ2BLL7Rlw5fBwqsB/wGNAvjwEqTLBVAWoSiUuiJU2j3z9X23WdBIyg6CZh5BjX
	JNzlA6RM//+8BjJTbcJ5vBXpkM8u/mDcwSgTVCpoyt4AXnWEK0i6lK06ge89Hr0B6Hw783T0nnWXl
	ZZgq0WvjP0/XwpW8Id2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoDG-0000000CJ0J-423f;
	Fri, 13 Nov 2026 10:08:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoDF-0000000CIzx-2Dak
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:08:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F3D866265D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA7C1F000CB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564532;
	bh=nZMLjQOnKSLNJDPbXg8WmoUPbegfRsFLvgEFn2RPTRY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TeFh1mZyMj5nQxcRroPfaId9yIqV/bdgtpq5BoynHhde8p4+zmt2HRr/AFL2rZQ6G
	 ysmLuO3JygPwXkLelCDIv4/Hzk6spaIk/P/p5uMgiQP1Mj1TmFoOShSjzn1jx6cycw
	 cp5/gN6HWoHssFORDMtCZiyFR22TbcCPkBCKVU1e9hRklRdhoUDIdNRooLzj4W+Uv3
	 02bc7d9tzzJXSjX5pL3WDCs1NZju6tc58E2BQTFclA147oe85eMU5ipPccxtqP8gjO
	 9sPG+HU3OmxTgFvLxDGcC6ct1021Cz9Lau2gfLBWI/2DxkJAPMRdqZqDGQVeS6AdSi
	 Pd/eOaCVSS1VQ==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-717080a2d50so1176875eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:08:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzEL4KNAVO1PXKZy5B2oHotNTWQo1B6hVduCHVHbvsHGPIc5dR7vhBQs1oLRAWHKykeYuazX0Gkd2EmYWB1jUw@lists.infradead.org
X-Gm-Message-State: APuU4Z9t7sKaQXXVhQZCv4MvOaO91r+5hJ423d0ccS/MxnQqi7dnDC05
	0uiDPAIdrj5svRG/RtDEcWLz+BcXVPPGNwwPRlCEdKovA44ChbZGagW5GIx3QgJLw0yyDOXfo1A
	YMe5Uyw5hKYc/nYCap8HZAjE9RIepyfQ=
X-Received: by 2002:a05:6820:a29c:10b0:700:52ae:7e4a with SMTP id
 006d021491bc7-71ab50ba8fdmr819670eaf.71.1794564531943; Fri, 13 Nov 2026
 02:08:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-2-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:08:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkwO7ysyF4A8UJR=ipDBKCaDzBGM_nNWDnE9RRCwdLH1A@mail.gmail.com>
X-Gm-Features: AclHuK-wzX5arsrKUblOchzdDuA5RMs0whEnr2fNyQpXUEzcUQOamAacHQe25j0
Message-ID: <CAD++jLkwO7ysyF4A8UJR=ipDBKCaDzBGM_nNWDnE9RRCwdLH1A@mail.gmail.com>
Subject: Re: [PATCH 02/11] pinctrl: scmi: map the schmitt trigger enable to
 its SCMI type
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
> the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
> INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
> INPUT_SCHMITT and refuse the threshold, the protocol has no type for
> it.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij

