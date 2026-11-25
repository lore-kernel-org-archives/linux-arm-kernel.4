Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE159606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szNpdJ5b;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jtOMx1nb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IGhLo1z4ZBqT3+OJqBHPLwoPaDjJ6QOHTiALHLT6qmk=; b=szNpdJ5b6omvygZu0f4DMN0d79
	GNsv120ohptbnaKrxs/I4Uq8qQxV5l8OPkVyeiWiSd7QtBQS/P8ZqOyX/ENrTzL2l01UvReEQiyoy
	W5W4wuStf0z9xDgm3xxeL9JCiNeY5RdP/h0L9lq414eg9eKqPM4dc8leGBcRgS5dVbuBVjXLSJGES
	2rPb3ZEco6q0vSZkjKbIfXeNrgVNZ70XlObKM6Yw6WmQa4JyPjjmQZanCgqUgTB9PwtW8aXg/2LCI
	3cdDSh2731IgLJgHKo+vkR9XQ47/EcrUtzSQCM8K/ALgUSvDH4WWZs45JTeBAA3QZIZ6m3SCJeET4
	e8xFnY5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFHj-0000000ASG1-3i6K;
	Wed, 25 Nov 2026 15:51:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFHi-0000000ASFg-1hDB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:51:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id CE7D263323;
	Wed, 25 Nov 2026 15:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id CDE281F000D4;
	Wed, 25 Nov 2026 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621909;
	bh=IGhLo1z4ZBqT3+OJqBHPLwoPaDjJ6QOHTiALHLT6qmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jtOMx1nbkA5TAhMyZ8AK4ua9SaISxLjviZWaYtjkpO4hu03BfmO7MI/HA+en1bQ1s
	 KqelSFiKbNXmH3AipcoNnRY2+Pxr5gqmJFrBgXOvldUr7YprAxuzwZ9uWhZTma++Zz
	 ePSsGTPlST9aDlDVcJ038exGSGzmheVWl+B4ej3A7HIQ78ZVjPuRnIRYQ/LVbSre+c
	 drIpyvgK/BhuoyR+wspugwz1G+OPHLlWeifzcvHeK8AsHQIPsiZfkaIt4Artiutc/h
	 +RsOL3JZoQSQGrJXqcqWTqTRxlRP306nlrI2fB2pO0YmgXv012I2OR8aaQyhXBXstC
	 XsUAn3X9OmQuQ==
Date: Wed, 25 Nov 2026 16:51:45 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/10] pinctrl: scmi: convert the drive strength with
 MICRO / MILLI
Message-ID: <l664regaj23mxmsghrut2dissfiuih3lzusb3p4d54f5ignxas@l5s3wv3y6lny>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-6-d61f039be008@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-6-d61f039be008@baylibre.com>
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

On Mon, Nov 23, 2026 at 04:21:28PM +0100, Clément Le Goffic wrote:
> MILLI has the right value but not the meaning of microamperes per
> milliampere, and <linux/units.h> has no current conversion constant.
> Use MICRO / MILLI instead.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

