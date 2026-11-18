Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EEA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t5DXo07o;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjJ9tHlI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mTjGPBEegQRgp+TkjbZALo5DNvb5ic4MusjOWTiPzo8=; b=t5DXo07oVonuDd
	PMlJaT5hrjJGvKxqhUsB4MzT0yZ2NtThmb0qBawiO1OTcjWX7rEKi367L02EqmPY4iWHfE+3VMegR
	VqFSBn3pCHRFeUVx/q9ZdKu1niyWB9aA4/sNoBD4CPdWH2NUvxR3Uv42CynV9KosL+4x8QArlF1A5
	BAGZf+vrDXlOlwWh6gviQq829F79dpiiMu3+hDfpCduUFgOQSV3ZlKBybBerLVQ/bPg9InRwHk/o/
	nkWAhVdc/yNbqxRaKpsq0xWYTof9SgnG7Fui2iJcykFgMbdEw9BgtNWSG8jAJmvg0ZDBeOaqDM0W7
	d6l2TIWLc48oE5SqyhsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkFK-00000009scv-3LUl;
	Wed, 18 Nov 2026 18:19:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkFI-00000009scX-4B8x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1984D635F2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 18:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CEE1F000C6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025939;
	bh=mTjGPBEegQRgp+TkjbZALo5DNvb5ic4MusjOWTiPzo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fjJ9tHlITqozv2A92bNFUGPP3O63gD73RHRUV66TQHLqaE4cc6+TzRhFOqy9gzhem
	 GTHREosT5FaTm2Pjdg+AjYNxu5//4SEZfEhEHhiozX8SZeWZ/8dEtGFuYPFxYwM4gK
	 etPTTSZracOXrm1gcffhReZFmNPHRh3Hm7sBQgaV8+PuzeQ/1B/K/+OagIpFMxgsFY
	 jkFkF/peQjEbokh2deNwGkjXqHFoWqnVcoWlqBfshEuyRIR2UswgkPTtiN2rgj3CcH
	 snSBneN/QS5am26e2yW9pua73F29jEy+Csb7B9imBfYjzayRVV3WVJ7VRlyQkE0aLl
	 GLz3xpVN2IP9Q==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1593fd141so1231482e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHnpwoXKzVrZDf6jPVOncYngoH7wm6+m5+B8SQAnFPv2I6plSfpjujSO4GpYwKY093A6fK/wPi/8/+QS5Tu5o0K@lists.infradead.org
X-Gm-Message-State: APuU4Z9UCOH0mTFC2nTIPAWfN+ybkQS47RlKQu/vx42MMawInJn95fUF
	M4nPiIBCP+gDMREvwJTzv5ycfyIO4NRx9svCFkK/2wG56rgzggDQ1iXRMfiIPR9VQ3FXTYJ+mQE
	JT9yXDiABf22rr9nm/WhTcOIYRLK5lyc=
X-Received: by 2002:a05:6512:401a:b0:5bf:d54c:1fb1 with SMTP id
 2adb3069b0e04-5c1a9b709a1mr1153837e87.2.1795025938593; Wed, 18 Nov 2026
 10:18:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
In-Reply-To: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 19:18:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLk66k1EJg0cO_+12HSBdOLvkCD65V_9eDzpXpHBK4z=Dw@mail.gmail.com>
X-Gm-Features: Aa3M54oSzmSzW6vVL6kt_cC3y7y55k_eM3IqSPDViqpXGwp_Vn4eEmeBhlms50g
Message-ID: <CAD++jLk66k1EJg0cO_+12HSBdOLvkCD65V_9eDzpXpHBK4z=Dw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amlogic: a4: Allow functions without groups
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Tue, Nov 10, 2026 at 6:09=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Allow function nodes without child groups during device tree
> parsing instead of returning an error.
>
> Only count and parse nodes with the "func-" prefix as pinctrl
> functions, ignoring other non-GPIO child nodes.
>
> This allows the driver to support function nodes without
> groups and avoid treating unrelated device tree nodes as
> pinctrl functions.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Add debugging information for error dts and Error pinctrl config not affe=
ct normal pin work.
> ---
> Changes in v2:

Dropped v1 and applied this instead.

Yours,
Linus Walleij

