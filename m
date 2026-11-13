Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9298B606EBDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gW8TBsk0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DXoAoXBd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pgnL/CHFfqdgibA2xLO5Ol3JFtq2ELbceyHKqknut+A=; b=gW8TBsk0nEHW9qoVOO7yJObw2m
	RO9HN+ET/Ft4eV5EmdXrcpj6hQWWfboqp+zeBy7zKISCxNQcq1rYtzn72hklCWrMj7YKLgkIwk8Bc
	nlkQbZMjBOvAAo/Y1NxXf08rA8+BNnkKAMefFEu5YqmAj/J2KoCfYmJ9MDyJ8/YJgQwL6vnfNni5V
	HIjvbAeO4K5vQoCx42+VtmoV/2mX7WT3dHAZnbhWvBmrx5eTrMqwkB6y3tdiZxpaNk4PYcxEb2b+R
	Iob6vJd7LhYBlFNK21q3S5UALwipTH867wHdo4L+AHyUU34sAuntTOatpTslxbtubDCqtLahC50k+
	kSNLQSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrFW-0000000CuF1-2Gz2;
	Fri, 13 Nov 2026 13:23:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrFJ-0000000Cu8Q-23qp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pgnL/CHFfqdgibA2xLO5Ol3JFtq2ELbceyHKqknut+A=; b=DXoAoXBdGfEwfE0rU4WH8aeFvk
	JgiK9eEoPm46AjX+lk1gLkj4j4S2HYcwMpdvUc8ljAF+fN0BUdId98qFliIeIXoi7cuSG/YQ0VF2L
	aNlIh9L3yhvoxqeDf3Lu/tZdDO1ITffT1GHxbyiKo7ebryk4iJflZGAqeIKxDtYtkfq0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xRrFA-00GHWM-Sv; Fri, 13 Nov 2026 14:23:04 +0100
Date: Fri, 13 Nov 2026 14:23:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, git@amd.com,
	neelisrinivas18@gmail.com
Subject: Re: [PATCH net-next v4 1/8] dt-bindings: net: add Xilinx TSN
 Endpoint Ethernet MAC
Message-ID: <8098f68a-bcc0-469c-be50-47403d3117ca@lunn.ch>
References: <20261113-patches_v2_external-v4-0-56bb26f042a4@amd.com>
 <20261113-patches_v2_external-v4-1-56bb26f042a4@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-patches_v2_external-v4-1-56bb26f042a4@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052313_687130_AF62C1A5 
X-CRM114-Status: UNSURE (   8.55  )
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

> +description:
> +  TSN Endpoint Ethernet MAC IP implements IEEE 802.1 Time-Sensitive
> +  Networking (TSN) standards and provides low-latency network connectivity
> +  in the Bridged Endpoint configuration. The IP integrates a three-port
> +  switch, with two ports connected to the external network and one port
> +  connected to an internal endpoint. It also supports GMII/RGMII interfaces
> +  for connection to an external PHY, enabling full-duplex operation at
> +  100 Mb/s and 1 Gb/s speeds.

Sorry, after reading that again, i realised i asked a wrong
question. All PHYs are external.

	  Andrew

