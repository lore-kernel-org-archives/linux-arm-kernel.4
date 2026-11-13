Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB3B606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MGO38oPq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GUywGuH7;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=mqwTe0LQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=otmMSTCuvsJ6UTk79RPkyL0EYsvw/uUkUKUkDiWOIok=; b=MGO38oPqyMr98s
	VME9wpTuhpAcqGPevC1tIBro3HKmbLhrECvY47xG4jdsiCMKqPyt4QY2AGjg1loNCd93lHqYop2LI
	ucFAizRBism1t0jl034QCKuzVQUCpORBpIZi+yw+LjSMcvBY9D7VKb2CuQ5NV1UkyXKPmP4+/8wR7
	YOV8rPBw5PSqKMErSplYT0NJRAm1wBlad7XZqZMYiU4TQAn6vQR1gIXj8+TzGoG7aTtG09l1NxGen
	4CMbi1Frr2Hc7m4um+nTmjuhiTCTIkNPtpUDcOgRnQMeylRlmqil3vsxcH4q7HGlRQLy2+FI6+/Tc
	kJgioJedwz7KevrEjDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyWL-0000000EXKX-3j3P;
	Fri, 13 Nov 2026 21:09:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVP-0000000EWnd-04Mi;
	Fri, 13 Nov 2026 21:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=otmMSTCuvsJ6UTk79RPkyL0EYsvw/uUkUKUkDiWOIok=; b=GUywGuH79j9+KDFwMlwKJ+Rr1f
	76XtZc9veZcwUcDQA/U0pJpct92OHzeLK/jym2lap/izWBUjHWpMPnMFsMD0VAqRyDTlwEb1L4iCi
	Hnpgkh+h5DABdGM8YgutJ5RkDu6Xmspr5obir91ZGPLTgHI/YjQ+mtAq/EmK3YELY6U6uME3y78iE
	i2kirp0Ox9cyktVu55WvG+RznRNllAd42g/GIwkmriJ9MOkzyPt8tNv/eHaDUZhHKV40FbucgB0SY
	vgcZLb5EpIFx7UvZJEgnRKTAvnPyLZPYOFO8eVptqO6GaR7jKOq11KBJX/NlwP08Lub5gNqYFrbkC
	sYOs1Fbg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVK-0000000Br4L-3PuA;
	Fri, 13 Nov 2026 21:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=otmMSTCuvsJ6UTk79RPkyL0EYsvw/uUkUKUkDiWOIok=; b=mqwTe0LQY8+9MAO5MUFfilqs4I
	tkQhfewvA2M+CruVyyrxWrOxgtXl5MJ3oXt4un/vqbjGpvqhG8c3SkDlVHTzYmUC/Edy42PnenbPA
	g08EAC8SsSCulAs0ekNH8rPzNfs/2khzxuJ6mrc1db+QKteLo/PS0/q9UpUl5LQF27XQ1T9ARKUNj
	ZAz0cMIv7dtIvjpGQZ5ilnXQVDrsWqb+HYOLQXcqA5DrgQxv6QtXd7t7+43gaL9QjDzTRhkgady1n
	0F9WCnmAGE96ySQl2ItOYi1NER29TRsHoZHwGk0a26tKYilBQSJ0SPq/o8OP/WAlDnjXlVRVOvMFx
	FgMz5qAw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Jonathan Schmid <kernel@picomail.one>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	robh@kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Pull down the eMMC data strobe on RK3576
Date: Fri, 13 Nov 2026 22:08:05 +0100
Message-ID: <179460406456.1165597.1652547099683766610.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109145022.75261-1-kernel@picomail.one>
References: <20261109145022.75261-1-kernel@picomail.one>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_210814_934767_5EF86146 
X-CRM114-Status: GOOD (  13.41  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 09 Nov 2026 15:50:22 +0100, Jonathan Schmid wrote:
> The eMMC data strobe (DS) is only driven by the card while it sends data
> or the CRC status token; in between, the card releases the line. RK3576
> configures emmc_strb with pcfg_pull_none, so DS floats between
> transfers.
> 
> In HS400 the host samples the CRC status token that follows each written
> block with DS. With the floating line it misreads the token now and
> then: the write ends with a data CRC error and is retried. Nothing is
> logged and the data ends up intact, but the errors show up in the
> controller's err_stats in debugfs, and write throughput drops.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Pull down the eMMC data strobe on RK3576
      commit: 330f3d6b0bd5e8694c7b80791444f70d2535912a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

