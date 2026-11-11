Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31DD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kxGuKVJS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jmYHQ7rQ;
	dkim=fail reason="signature verification failed" header.d=iokpp.de header.i=@iokpp.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=OLEqGKP8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UZdwgTcrfuIpSYM1gCDi0i+eUgKIG7RMooqWvyPgmb0=; b=kxGuKVJSf9cRJUifjEAVS2otnh
	BGmGfQf190dSyoFtU8GoAkzp5EmPLpWOhXH5fJUsi7arySieDrBFBma+P3xf9dSEClY+bAU12rc6h
	EOcPP2ApatyU/G2WaX21GDF6JuUsjWn0rcMyIdmxXZDYuM43EWEqd1G3dPewUVEhvPsRsBpM41KcT
	CF7O5Nf6/sp0JA7HmB0t993eZrkimDzaLxrEDyn/lghrjPbks34Ek6ej3spqjhh2kswbY/4W5OrZ6
	wjp0PQYezxqDmHfjxNjRmjlm4Vo6BKkp7OX8IOQ2/KEPHqW82uIk4OGiVEd4NgyvmSc0+0vW5MRQ2
	+yazHZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDHQ-00000007Rf9-3DiI;
	Wed, 11 Nov 2026 18:42:44 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDHN-00000007Rdd-2cn2;
	Wed, 11 Nov 2026 18:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794422555; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=k5S5Bl7FubLTqmU88nzo26Kl2dj3Ric2T9t/lXXPVJUSOGaBoOUTYNRvlCE0GXtENS
    PwShzJgYoyYfbSyR6VFoAx9u4XFE+DovYYdUiB6hrZRzqP3RI5+bKhF2teMAeuBpiLiS
    k3NtZX8EKFZvLC3znDEDmcgn9/2PBDDz/T+j9q+oK/gcgxWVZhN4qcNH35h7Aa1nPveE
    Neczv3DZPTSkhi5HpalDUPZWM5itTf7iW4ktHFjvMdHN/a/20g1QUNlbJNtvZ1DBx7sq
    I4JvbArqpqamUXBMTZ+cA9VFcDMEMAzEW0Szq6iTGi7i2hntIQio01++ib0i5IT+s4IR
    2ndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794422555;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=UZdwgTcrfuIpSYM1gCDi0i+eUgKIG7RMooqWvyPgmb0=;
    b=qqE4aNze18q/ZYxr8rJ/Tgv1m66+qNTukUW4Ov8qGQhl2NhLDGHXhul8NtChqMmkiU
    4COoL1ZPB/u158J5k4xSDus0cqTnpB6soSAw+ZqS5P4PiFjikTxUvgOtXFoQqAhjxi4t
    cGL92dIlj7u1QqOY2vHfP5ieyOdnJWkUD8DFBleW0tPQjGbEBsNysFtn7JVsjWgB5bH7
    NJYQkdENiK74ZDZXK0mWmDgOXcVkBv6t5o7nWk+zHQsMpqMx/7/6EmbP8Stx+qERb/3/
    Y8qgSUU46orLIub72I6lHe6olJxDEvM1Y5EEVyuU5FKWtBdt0L/y3KUvNrd8EVPxRu/t
    p5eA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794422555;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=UZdwgTcrfuIpSYM1gCDi0i+eUgKIG7RMooqWvyPgmb0=;
    b=jmYHQ7rQSB1Tzj6fEt10Cans6f1S2Z/WT60scHlWjF5u2f2zH7jv8TWFr9ZtT7MoiU
    8jye9bGwCNT0aKKOcSr5Wg8XBzkEIzzI+8mmIwo1FZnJG6LZfOVDuZqFkkyUU/umHWIW
    Xpbua6wg8Sd+8rOlpwtPGB6lHuUX083ldYTGJ/GHGT8Ch+6EWSue5iytdDGwrzfO2dXY
    2QxmLvlAnuoimqjYiifzTl7hQxXKNaqtp7ggE7rGG69Hz40JgP6h0YzWe22Z7KCIEdNy
    BqIzbI+c7na3DTUHzV/7c2+qDr3BxIeYhcR7YmMqLCFf0vj06pcjQf/5g7xMar7w2ZCF
    smsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794422555;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=UZdwgTcrfuIpSYM1gCDi0i+eUgKIG7RMooqWvyPgmb0=;
    b=OLEqGKP8rL1/Y5mfkMu8X03OwrUS8pT8L6GgGyaoLQtNjvsfYzZf72RksCFZEIXI/q
    SMX59KF0dnEg5mSDbABg==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0zNriHg+YfT0rGaTpIu+r+eHzyBFvc/0mM2I80og9K0iXpLsCzk="
Received: from p200300c5872329b218616a30d22a9174.dip0.t-ipconnect.de
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id z831ad2ABIgYiCS
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 11 Nov 2026 19:42:34 +0100 (CET)
Message-ID: <b2338a8e84366980f648b0e321e9f8edaaf633a9.camel@iokpp.de>
Subject: Re: [PATCH] scsi: ufs: core: Register the RPMB bus before adding
 devices to it
From: Bean Huo <beanhuo@iokpp.de>
To: Alexey Charkov <alchark@flipper.net>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Bart Van Assche <bvanassche@acm.org>, Bean Huo
 <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <mkp@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Avri Altman
 <avri.altman@sandisk.com>, Can Guo <can.guo@oss.qualcomm.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	stable@vger.kernel.org
Date: Wed, 11 Nov 2026 19:42:32 +0100
In-Reply-To: <20261111-ufs-rpmb-bus-v1-1-b07100e53f6c@flipper.net>
References: <20261111-ufs-rpmb-bus-v1-1-b07100e53f6c@flipper.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_104241_921473_F09077BB 
X-CRM114-Status: UNSURE (   9.16  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi Alexey,

Thanks. The code is correct, but this exact failure is already fixed in
Stanley's series, which has been on the list since September:
https://lore.kernel.org/all/20260914144910.931518-1-stanleyjhu@google.com

The order there matters. Once ufs_rpmb devices register again, which is wha=
t
your patch does, two bugs come back: a use-after-free on host unbind, and
concurrent RPMB requests that get each other's responses. Stanley measured =
both
with KASAN. Patches 1/3 and 2/3 fix them, and 3/3 turns registration back o=
n
last. Taking this patch first would open that window again in mainline and =
in
stable.

So I would prefer to drop this one in favour of the series. If you have a b=
oard
where RPMB fails today, a Tested-by on v5 would help, please have a try
Stanley's patches. thanks


Kind regards,
Bean



