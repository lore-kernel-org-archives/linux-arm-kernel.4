Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB2606B11D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xHIbuG9r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVfrwGb7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c5kWoRfoh+LID+vIMXgha8z+pQ8NIChzIfvaIu/18OQ=; b=xHIbuG9rfn0p64
	U3jIrLoSZQh3y9OwL2M8bUvLjFJ6Q7qoEeQzIiwDAsqd3yvV83I2IHHqi9uWhlS8w0KJOoMRz5x7s
	lThNSkjSJLH20CUz1aguCCitRWLS1dMDrVKNRAYOJkTIrevswe4TEo++RZi75XkLPBW2H/IMWgaRq
	y1q+EkQ5VvNv6KLVATFqIFi+YQjbc9Kxev720UJQ+MkYJKu1PMSvmFo8TmNNStxFFGw0OCWzij8ER
	AyUanGP3qED3uKdMhoYjLOzwU426hxIVZiDSjFqPt1Fm5b3q30PszgKWmqiH/KAUY9W+kLj/1CkBi
	d8DDaXFCcsClxjtTK9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoFu-0000000CJWN-2Lyy;
	Fri, 13 Nov 2026 10:11:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoFr-0000000CJVU-2X5D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:11:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC7A345AE6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39F91F00925
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564694;
	bh=c5kWoRfoh+LID+vIMXgha8z+pQ8NIChzIfvaIu/18OQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YVfrwGb73VBd/mLLVth1dbc+CKZgt/nfR7trq3JvDURbVPM88IHuNK4v+2g7Yt6xe
	 8TVrG6j3pw3Povif5CHNl0Ov4qX3JPFeIsEt4dbI4V6H34DWMcEfF0xKdpRLQ4Ybxm
	 2UI5U6Z/P4MSaKw2PTrRBN4i7tAYUUQqRw9KC8+jtGw+l1617PQYrJqgI8MwMjXgC+
	 uOto5Sqha6sV4NCrnJKFIdysqQzbvBIuyke+5he3GcLRuB36FGs37RrXl56CNhWBVO
	 FBGHScyeX/XqH3y5R0xhOeeZprbuudAvWMJ3sxKIZmD4DNa2E4v7sPsl0uwcdzE0qf
	 8+VoX66/yAI+Q==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6deb848ddd7so1028320eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:11:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIViJw5t/tx1PAFdmr/MuczVWWxjVlJf4h1hrDmaFrJSzxtEWes4oLeItMm/qLRVRHSlza+vERpqaC72Q6nNFD@lists.infradead.org
X-Gm-Message-State: APuU4Z+ddjEO1Ypx8nyWP3LmX8LEfWvWS0DspjL7omKvoZjnGmk5KNT0
	2xquAadpNkDDvawUtBgh0yXvJ41QiRlEh6JVdczUDkhj/yXMeGRRtSh9+D0oMSXu1cVYpBs4gZt
	eCVpf8YEIL+FbKIGV72WXyJspqXgKNRE=
X-Received: by 2002:a05:6820:c2cb:10b0:700:8d6d:93fe with SMTP id
 006d021491bc7-71ab50158a9mr835957eaf.38.1794564693938; Fri, 13 Nov 2026
 02:11:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:11:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
X-Gm-Features: AclHuK9gw9rzvmJfnK1wHvLc_pWsubTkRQG1I-TXfEXhLtnbQg50tNAfCDomXWw
Message-ID: <CAD++jLmS1Et_B_U2W5W3GAx8ge5V+B5innksqKwxYnBzh=JPag@mail.gmail.com>
Subject: Re: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
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

> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
> driver registered them as groups. Register pin-only functions without
> groups.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>


Patch applied for fixes.

Yours,
Linus Walleij

