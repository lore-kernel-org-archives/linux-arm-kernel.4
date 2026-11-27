Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FD7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DKnB9M62;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNzjhTCt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4DMcsVBCyuxSJxnBHMXvc5HVYKbb1XH0m0g8E3RsK/8=; b=DKnB9M62rImeXg
	MC24s8qcJdBYGAAZGbubETg0Oed8HrUZc8EudAhH7jzwTgNwznm/l+MkcSeOFxpwy2p+ePUkDGeA1
	ZsU9Qo8tY2MGjdnPhdP0o79oUDGCBnxgoD0FMiTE/ab2BlH5SUouJbTdykxBfQeDjeCn+Ca+XUD+6
	HKkMtoaW/oYGrDZrfaL58hetoEf6YHsKQSxE12uJaicrukY6r8n4BNRgrGz7DfEgnrfSMro2XvQV8
	Rqs7pJgtwQi4jWqM6v/rMI5JTss2up7j6LJ5HyJHIoXTgqn0EiY5Iaud8gOfxNMn8abKlv0GOIS8X
	pqGr3F8pNHAmWU5dHUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsgb-0000000FUS5-30Oe;
	Fri, 27 Nov 2026 09:56:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsgR-0000000FUO2-3rVU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:56:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so67671815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773358; x=1796378158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DMcsVBCyuxSJxnBHMXvc5HVYKbb1XH0m0g8E3RsK/8=;
        b=yNzjhTCt/mX3HDRRUpd2DtPpbCQs3f9eTYNTVQJKmlBOZf53zDH20TE8rxWmEJwa1k
         wa6U6UIE5dqWQHNYOR2iJhHLffzbRbXn4p0yi+ZwKqj3idLsnzC7DSIGMBUWYVP1+e9H
         LMvc7E1YZqwpS2Jim3bTlt/XlCqTXh0BxXLnNhbU4h+I6+i1kIK0itAekYNHBTNP8OTR
         nl7YSbQ5hI7RY2ukwFXMB6M8ivW4H1K3mc81vFWP1lU63/qhOxwIq7LEoQUcFJ9GuUsc
         yRcUWEzz+jQbVSoD0W830obT8LnRzGMgRS590SUDSVzVR8qkFy+7iYXUQLtXtHNGjZT6
         EO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773358; x=1796378158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DMcsVBCyuxSJxnBHMXvc5HVYKbb1XH0m0g8E3RsK/8=;
        b=L1k5j9cj0OeMRDoOzqvF6q44Vj6Ugxnuk5b5wvHHV07OVGXPIP97zR8AaGSyXV34zv
         bmf2NlzMx2ERqT/k3KMn6tCcziFU1ITsHkOnRXLOL33bMcmtT0hWO/QjjF8ImbsUwBBX
         4aqlmHbTbhABK6jDaJeCZQBOODk8Gj3ceaY9b55uyEdf/+cXLj4e0DkZ/TBnBPmmms/F
         Z1wMrtOHw0T9XFOoxybL37Wl1gxxgdLEYQc29jZUJIsuHShfY5DrXzXg71yM2WUheBLw
         x3ykqrv3GpQK3N29yUIrx+1hPFDemiMoEmSBvxE4471kpd76r8pBFhjU1ISi0k+9irKd
         nEHA==
X-Forwarded-Encrypted: i=1; AL+hErFzn/mpdayby9K2F1zfdStnl60Dktwm1WJogtUGDZlRVgIjGJ9X6KFv5JzlFhyWA6SvdxgUF8yopJD0izBHkVMy@lists.infradead.org
X-Gm-Message-State: APuU4Z+5Z78+N4f+mZEbrdGXprTX1Gsxov+vTodB61Bvt206oZZR4IKa
	vynEGAQ5nTB4U9dxiuD91Uifr1zb0AvKfXQMyLsVDTDX3FJ3dkX8AeFU
X-Gm-Gg: AZFdTZcKEj2WaSwFR8lrvY4V5+EUd3mYurR9bT0ZAL6klrG2A6P1Vqexe4bPicTpQfL
	L4lm2z+1AX0YxcCJFEiIPwCE/3k5r3aK2JRqowQDhNVT3aNGJ/AwxoUlISTF9Er+8c+Nq9dv4a0
	U6Nc9aaKFj54fmQUhVrKB2EtKxoBmjfMISU+NgIJvZdZ6GRXgyoL33XLQOXJmncTJj8EMVzb2KN
	I33FHWw645oU+1/DfjYTMKczcxm1HWQLot6hdTX20pWq2QAr9qcbf13OXI7aFmm+0hcwVjSLgeB
	1Fq/Jx+fyBqhI0BJdzgKfEHkE6CSvvcuOHzgTMfSaKq8uSDn+Dq8NlVQtBNY6l/xzaAvVl3iecG
	peWrhDb2n2zDlRoyB+t2qBMz5qf4TmoU4QQp4fu2OdiWhMUxAbCd/3ULbgmDjiqr/0zmXBK4JF9
	Gr3PTJ8AZ8dqn80fpmjB8i0sL1MmdONuKzpkIiMCBTeRCxX5HOgzaoQfUPq5FH84ElWoaJh1YkJ
	5nqY1De0QWPIzAIAtxhOfdpfeirCAuw46/3nw5vrRAJd1MtK0Pggi5lMTmNvOJJ8AjiiAkdiAK5
	0bQ37J12ywaZ4rAQrRWXpVMh9E8eV00wN6oerMk1rEuOtz3S/KAhnhvbzKrP+tJNXwEDqRE5Z7N
	E5IMSKtk7eJlSm597/yycfnkpPGXNu2AFykgcpAlDcCgw0g==
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr455477665e9.7.1795773357686;
        Fri, 27 Nov 2026 01:55:57 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm560192195e9.9.2026.11.27.01.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:55:57 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Liu Ying <victor.liu@nxp.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: dw-mipi-dsi: let the glue compute the hcomponent lbcc
Date: Fri, 27 Nov 2026 10:55:56 +0100
Message-ID: <20261127095556.1794628-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143031.880389-1-romain.tisserand@gmail.com>
References: <20261101143031.880389-1-romain.tisserand@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_015559_977982_46A6EA65 
X-CRM114-Status: UNSURE (   8.06  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Gentle ping on this one, sent four weeks ago. It still applies as is on
today's drm-misc-next.

It fixes the garbled picture of non-burst DSI panels behind the Rockchip
glue (GPD XD here), and v2 follows the reviews of v1 (Chaoyi, Sashiko).
Is the get_hcomponent_lbcc() callback in dw_mipi_dsi_plat_data the shape
you want, or should I rework it?

Icenowy, Cc'ing you as you are working on dw-mipi-dsi for TH1520; the
two series touch different parts of the file.

Thanks,
Romain

