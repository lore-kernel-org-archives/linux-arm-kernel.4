Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE87606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZMa7qKI6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZvaXbL02
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GZjMfrUr3XmhgWf8hPROW+HmkG/OoHfUFt7B10YN/bc=; b=ZMa7qKI6sSIVYK
	iunIpeDO0CZ+OiT6Hk8PfiHJYPW+0PIZhL6gOSPXN3rVuIAhDFa6zLFap6+Ndt1XwyaEIL+pVLl11
	nAfZsUW57pyrTkMMZY2E4flkPSqqv598nFod9PoBbIFJJiXOt4u+MguyJtRwOjXA9qeKDzGXmtGEt
	fLec/NdY0hqMQS+RfXt6aM+1wqwWUtjDlvt4eglSwFdnGIddJWT59SUwX36KfXp1MQXz8PqLAG0/f
	CEWzsxZpIpnhpqWTfKmEWnVoKJqxbwwqslo6Uj7sSUyjUqDayxPgezSCfKEdMW/bpAMS9rVtjIb7Z
	oLjMm4xPt7bNBZc8Ssng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQeH-000000076yk-0wXq;
	Tue, 17 Nov 2026 21:23:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQeG-000000076yR-1ey2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:23:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3EFE618CE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1211F000D3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950607;
	bh=GZjMfrUr3XmhgWf8hPROW+HmkG/OoHfUFt7B10YN/bc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZvaXbL02mfeBYGx6S3YXxD1g/Ale5OnwClltwO6Arspn8wsAQtfnpbqh8cQyVKj1D
	 WRGArWanyaN+widsatccnr79F5E9PruXMbp3+Erckd6xCn9AuM90lnj9j3Y/oKPHpj
	 r5b06oTjTbN5N33MKKqPlktPe1Uo6sz7cfZpfYzfiU0GbBYY+gSZoTvPpLG9UW2chX
	 zT4zZtfhi60zGUL0QFzSW4/aZBSIrOv6BvY+lHWqKb+n9PB5i8T1yBj/UqAWclNJE6
	 I6O3DfG/b/ipt0+JhyqSquKIVgZgpZpij1Gu+KcIgGgQivL7kISDycWUi9TEs3//SP
	 2dIUee6SW6tPQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso264349e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 13:23:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGovv/JLZKw8/VnA/F5T2ublyPJ1k4QMzKZhraF6JdBGKFSqZ7ZZiDBbO6DR8G1vD3YusD/fg8k0025VNl73rZS@lists.infradead.org
X-Gm-Message-State: APuU4Z/pQ0ZHx/muRd9EpAtV+HSlsA89NmBgJUh76BLuHWL38dgSpz6/
	DdfRmlAwpz0ZVy5V5FYT74zvV9VADX5zxBv9BFpogGU0jM8QMoaRvnMD2vLYaZIE+SxRC5dJgSd
	VcwA94pYczUKeZTO6sWyuwy3RHwUWwhA=
X-Received: by 2002:a05:6512:10cd:b0:5c0:d102:8363 with SMTP id
 2adb3069b0e04-5c1aa095f77mr100549e87.38.1794950606321; Tue, 17 Nov 2026
 13:23:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com> <20261110070803.1099-3-zhaofeng2@cmss.chinamobile.com>
In-Reply-To: <20261110070803.1099-3-zhaofeng2@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:23:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLnbEmP9ABUb00ZHWZ+3KHOcozBfnzg45kr1=Zekxs40ew@mail.gmail.com>
X-Gm-Features: Aa3M54py_xbuD81Mpen7PMYfOauNjDlw9rFU-q20_qg1ygTb44wF51hLre1aTTk
Message-ID: <CAD++jLnbEmP9ABUb00ZHWZ+3KHOcozBfnzg45kr1=Zekxs40ew@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: ixp4xx_hss: fix OF node leaks in ixp4xx_hss_probe()
To: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Imre Kaloz <kaloz@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Tue, Nov 10, 2026 at 8:08=E2=80=AFAM zhaofeng2
<zhaofeng2@cmss.chinamobile.com> wrote:

> From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
>
> ixp4xx_hss_probe() resolves the NPE and the six TX/RX queue phandles
> with of_parse_phandle_with_fixed_args(), which takes a reference on
> the resolved device node, but the references are never dropped, so
> the NPE and queue manager device nodes are leaked on every probe.
>
> Drop the references with of_node_put() once the phandle argument has
> been consumed.
>
> Fixes: 35aefaad326b ("net: ixp4xx_hss: Convert to use DT probing")
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

