Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16E4606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Td/4p+6D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mtGj6veBCDbwsO8PKWpn9QJSGAVDV4qLDzsTbYJws+0=; b=Td/4p+6DatMqXe
	WzKnNyuhXvK2m0bg3p7+A1PxtSIa9AbIwEkOwKnxUGuQCpI6e4RL36gTJSSgQiNNAV4YQl2AP+KCq
	yLBZTrrFkPbHX1xdVgjt5wdNQ5MkSUiKQUSjM9sp8v7mGatyIvMH9SZ7uTD70nFAk7y7WjDev8/TK
	05zGo2hI1vCN+ze91ULgfjIbTNfxcUS3/zb6ebT7JvunCDOsEUWn6ShRXExe4iik3760I6+NHiwvJ
	spg0aRBR3jTi1clULq/LF0yqsrADmqU89cHM8HfMEg5vF7yl5KCcRJmGJe2Y+EGGOkBt0kuvnVjNm
	rLEyX+1kibDu/2fczZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpoI-0000000CaP1-1Kwi;
	Fri, 13 Nov 2026 11:51:14 +0000
Received: from [101.71.155.101] (helo=mail-m155101.qiye.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpoD-0000000CaKk-0J5X;
	Fri, 13 Nov 2026 11:51:12 +0000
Received: from Vostro-3710.lan (unknown [14.220.232.40])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54988c7f9;
	Fri, 13 Nov 2026 19:50:54 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: coiaprant@gmail.com
Cc: amadeus@jmu.edu.cn,
	bigfoot@classfun.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Fri, 13 Nov 2026 19:50:50 +0800
Message-Id: <20261113115050.362683-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CALj3r0hOjksUtYg+qLqPU9kz4w3SAqGvSmFFi9YBXNGiEPEZSw@mail.gmail.com>
References: <CALj3r0hOjksUtYg+qLqPU9kz4w3SAqGvSmFFi9YBXNGiEPEZSw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d4bf11ec03a2kunmbf5334663d203
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGklMVh1OTUwfQkgfTEJMTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVU9LWVdZFhoPEhUdFFlBWU9LSFVCQklOS1
	VKS0tVSkJLQlkG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_035109_326848_8862A17C 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

> I understand your concern regarding 5V_OUT not being a standalone
> physical regulator. However, I'd prefer to keep the node for two
> reasons:

It looks like you copied your previous reply.

> Regarding the startup time, a fixed-regulator without GPIO or clock
> controls does no hardware I/O during probe, so the overhead is
> negligible.

Adding an uncontrolled regulator is not recommended. Similar discussions:
https://lore.kernel.org/all/90eafe45-7863-4c1d-b1e5-55a4fe32c806@kernel.org/
https://lore.kernel.org/all/20260511065338-GKA3624147@kernel.org/

> On the node ordering: the node is named `regulator-5v-boost` (starting
> with 'r'), so it is correctly sorted after `battery` and `chosen`

I misread it, sorry.

