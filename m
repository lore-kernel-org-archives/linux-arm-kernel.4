Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6322B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kbcZjZzf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=wxNa/zeN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nNTfQN2WoengZbD+BXY0CaTYtpF5bLo/3jNXNE74Cmg=; b=kbcZjZzfr6V/nAOPGAL+Eb9C5d
	zZkZjAZ6qJ/1jzKpgJxJ7D6ujhF7wLFv+JK8jPz+ubyT/W1k4flNIrG6zxVb6XYdBcDFa/2e1X4zy
	/vJQY1l4N7Nsagm99QX1Qj8re/hfOwLidq4nEbvQkCVs+zBPu92afnBMuGHnbBmTNULBuwNwBQdF2
	6Eii/Lbgtp+rS5CSzDdDR8DH7F09RzaZ4h1IdswMqCmUiYgRJgAahq2P9GZMqB8rhDvRkq3Rf06KK
	1IgRcwe+H+b8U6TID06yf0W+u8Bw9anmO3lbtEDg8MQjUO5hRCUIEX5Tu3TfAcQlC771ZBogLYgV1
	WEDU6BEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNZA-00000006inT-18eQ;
	Tue, 17 Nov 2026 18:06:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNZ4-00000006ilW-2StN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nNTfQN2WoengZbD+BXY0CaTYtpF5bLo/3jNXNE74Cmg=; b=wxNa/zeNdpgw5Vm2AoMDMaUl+k
	y4y0UqXscB59zJiJl/siXlxEdMJDFQLUgcWKJn3kcF8OUx7ud38lXPPJUdM6mzS0KK1abBoJI2oEM
	rnmqmDeUJSXL77d/EplvqO8axBfO1yWK333jDPmtMCeFX+AKwMPeKkdwSmkyUBZ8y3Ss=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTNYg-00HEQB-OJ; Tue, 17 Nov 2026 19:05:30 +0100
Date: Tue, 17 Nov 2026 19:05:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Boon Khai Ng <boon.khai.ng@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net 1/2] net: altera: Fix potential use-after-free on
 removal
Message-ID: <b8f3c9d0-47e6-4949-bb17-477f8a4e52c9@lunn.ch>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn>
 <20261117-571e631490-net-1@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-571e631490-net-1@mail.sdu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_100554_642885_491B1F6C 
X-CRM114-Status: UNSURE (   5.93  )
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

> Fixes: bbd2190ce96d ("Altera TSE: Add main and header file for Altera Ethernet Driver")

The usual question: Does this bother anybody?

If not, net-next, no Fixes:

    Andrew

---
pw-bot: cr

