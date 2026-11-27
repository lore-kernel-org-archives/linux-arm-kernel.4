Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EC5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Gkj8s2E;
	dkim=pass (2048-bit key) header.d=mechasystems.com header.i=@mechasystems.com header.a=rsa-sha256 header.s=google header.b=tOHydsxy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=; b=2Gkj8s2E9R0tqi/I0MSQ4+X7mW
	/OyBn5aJ6/w7EbebHKmq2Gyt/8LYhLH1LfCwVvE1aYf9JUmmGkowRMDJaOITVkEb/nA02v4OdE3eC
	JI5tmD4Z7ZSI8gDsc0rZg5rQW7S5c2txr1rc0/WV/rX7eZNn84aoJ0YKcsBt//fTZTQva1MMckEhP
	Su7lHj1Q7ThWGDERpTa+EKEiI2eM4Qzzai7INkgWRfpIZ6tDVft7mrOLkwm3hIUQEUOg89pduBB0a
	Wxp8MPiHvqh6vW2JkK8s06FyY8IaC5k+B1M409n2BfxGtAj6M/n1apyCDGQA3q/EWDF+S1wKrJhSc
	FR+ANlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsRJ-0000000FSuJ-1HrS;
	Fri, 27 Nov 2026 09:40:21 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsRH-0000000FStk-0slP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:40:20 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1b563e32936so3758666c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772418; cv=none;
        d=google.com; s=arc-20260327;
        b=O0lmR174LshbZrOVSXlGGR/46mtq11xGGpn59WlkNy0kQN32/rE6yoh5n6iupgesgM
         kEoU3rPu3mlfUlbFQhOVMCZ3cdoetbrf1lRWdyYPJFeu+AI2/OiDVYBJX0occLqG2dH+
         kfNI4KI+KZgFKDEyZzTRFoi5PU/VRjhnodnFyEobccIziIYoUvLyaAy2+Vzh4jcF/Uk7
         UzwGeUju2VoEhUnErOJ/3u4TIjhe/FYrC0v02eDVenfLBcFTXajt9R81r0ufnJWMHS2j
         AzzuwOyZ6zu1EYS+lCRA4ZcT+R5cjCKDZkHI+fZ7WLwbBlx3w1+I0VPwcYvsGkL4BXd1
         /5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
        fh=LZmt2u0b5Y4Ezrz8VO44WAZmhrgjvyiSLXnqZkYPW5k=;
        b=Q7KRCzaK84l6CgZyp7f0NN5sNmb+UZ8SrUvFIB0eoH6oRblqgWFD1xAfowcwyfrkP1
         jyis8GDQaVLjJJli2DSYqeRvpK76T/FgVAUJ4lPRY4pq3zZRuF2xF03Z9fMDH/LtWZX+
         iVKXjwnH0Rwgs4HjNCst1rWuDY0s0V6yTF/bhO4woBnuUE1/5cQqRlFWZwnxsE6rd2vI
         kAhHuwdazvMbSfTYoClrNa/iLBEE4zTaYOpeX/0B+ILxu4wtPvVi/gfuvbXe+i9wHHHY
         //EN5XpfYHNTi88r7gvRmvL6ym2JZHgAOlGD3ZfcSeyx6qk6fJHu8lIdFRUmcwoM0Br3
         qKmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mechasystems.com; s=google; t=1795772418; x=1796377218; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
        b=tOHydsxyXl9KoUKJ+v6pXyec65DKV1Y8AJiaxKv21PvzlVvYHK06oYlxtm4hVCwpSL
         vXC6XVz0J29iIbPLbcRUi2aQToILqB/pEJGsRsmzZnxtbmzUW8NkJ9KodvMmkzXQ/WjF
         4CxqhKDpA6UGY3/+M9k/DWJZFvyr6RoJhFw2HSKVtk96Yx9/drxEzMsOmAeAKnEroVud
         QEYdHr17EB2CXOicpgbjvKhVjdQAOe/feDSo9J/c2om/saENYPNe64t6u15F+WSEz0md
         69O/2lxiCXbNCsJeU0VrZX5luAZTMWgDCh3WI6knAtuPMOsGRLJnkOr8qtmtvFi8BoDj
         /34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772418; x=1796377218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
        b=OAcuF9HhzzVbWERH8FrVBeXcvwBTxvBHU+mpmM8Cs9B8o2r5aKZNMxLj/xMqooESsv
         2NU3neK76NlejGLbqGye609cCa0MMnQLgD7n1Bqe/t47Yv7vg3iIFtR8jO9MK2Hx/mHK
         ZRlTpT2Mj3b3CXzsHsgIWdv7VZphV6ZJx2ZHXq/Z6+B4AgWY6QC6bO3L9ygT4pOeGvH6
         ASaxF5V0K33g24opfsBc1EW2SNykV0kgSJe7nxwrWV+iMcUgKsqMJHmc3sLJuR9+648W
         TYsXDFv6aXsqOBTDbmqDmJOq8YkBaUsIjvmjDq1NeUhLkGyngFCaXqmrO39kAgLQcyT5
         MJcQ==
X-Forwarded-Encrypted: i=1; AL+hErG15kL7kKT7mO74qaJ7894vcApTYz1MrKgx8A1Tf5DEoytQf+v7QWKL3+rZxvXZVNDG+X+j78Z6mX+0GN/3hgCd@lists.infradead.org
X-Gm-Message-State: APuU4Z8W+o8rcnz4ViE015pfQ9oSJy84f5PnGnNvtzRdoPKIWrfHq/AA
	R5LNKdMaUm/jye4p2Fh5Eea1A3AUNG7mL54kXXojH9MAj2cc3g//J47+u4mJhJy+ABxn7uRZjR0
	HaJDKU3bnpv5b3/YR8IJ86xZmM3NgRzcerivw4tLzYg==
X-Gm-Gg: AZFdTZeEzyPMZ2SbyKXjVHXyTq/nY2cTfl3HxbnSVstV5bAAHi8s5V49VJaZgou07hL
	q60wW/crB3daUazd3iUVx3oaBdsy/BRExzM57zOPuOROMY3XzFzzugpFq8sS34U1jVXbH6KK5ay
	EvIqtU+fimN9swVvoSuy7/LlXgAK/cL9IBh2L0Fff55iKA2aXhyOBRwilolBXhvIn3Pox7uGBTY
	BHLFKzqctcIX+ge/uDg7X8f+kA1/RxTIH8Rk6qnamAz51wEUx1Sm6BWGBnraBIFk4OW6oq3kLLe
	M7YQDQ6kE5OsdqwqESKOAFxcoIKhHwMbVAe6t09koTmAUGgUNGM9pbTGXydsA5HUahtkOCqubyr
	f/ZPmRDBXRcHAEH6gTJC3SDSxo0BUis0b2vKboqzHMA+tzpOrb4KM
X-Received: by 2002:a05:7022:1585:b0:15b:7f7a:730d with SMTP id
 a92af1059eb24-1b55690c5a4mr24437470c88.28.1795772417913; Fri, 27 Nov 2026
 01:40:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261126164058.2373605-4-ivitro@gmail.com>
In-Reply-To: <20261126164058.2373605-4-ivitro@gmail.com>
From: Advait Dhamorikar <advaitd@mechasystems.com>
Date: Fri, 27 Nov 2026 15:10:06 +0530
X-Gm-Features: Aa3M54pqKM0_HhnbUssU_T72ZIWahp4yBY12MFpBmxas869Jc17TdRiWDxmiqGk
Message-ID: <CAAPs2HRq=BXVabGvHfK33XcCnu1huzkBW8=VxzaJVcz85Cwc7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pmdomain: imx: fix suspend/resume order of the
 blk-ctrl virtual devices
To: Vitor Soares <ivitro@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vitor Soares <vitor.soares@toradex.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, 
	Marek Vasut <marex@nabladev.com>, Peng Fan <peng.fan@nxp.com>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_014019_258242_27AC1820 
X-CRM114-Status: UNSURE (   6.20  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on i.MX8MP Mecha Comet with both patches applied on top of
7.3.4, Suspend to idle, RAM and resume no longer hangs.

Tested-by: Advait Dhamorikar <advaitd@mechasystems.com>

Best Regards,
Advait

