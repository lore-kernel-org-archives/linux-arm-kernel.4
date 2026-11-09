Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA3B606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mRtyAlpE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOf0s6xz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pM4LipmI99ts7wfLn3qsR8+LD0Ifz71Ahhr5FYGBQ4s=; b=mRtyAlpEJJnzBVVYwqI0AQXZTz
	7KztAt2hx+VDE0rONDfawTX8ytWyRVibtqXejV3MfA6rlKmNJ8MrlkdQoimbNPy0XiaXq3fYQbQFj
	SI/P8KTKILddI1bizYCfveWgQIB0r4bIKFmIYWaiQaX+mZsnDg8rWa9TorgUdDfvLApaG7gJ5wRhK
	bLKTO3iwELS0baxTcM7c1wIbNUYcijRI9U1/3mShiJ6Opz1KG+1wUQjquzvTz2762N3h/umH01+9x
	We3sYf0bRv2Amf2ZGMM0sLXVBDg8/teyx57R1+tGFSSHQW+oVvx6DtnINHx1jZhfL1ERY417muPvV
	Z/Clen2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQiJ-00000000zHM-4A89;
	Mon, 09 Nov 2026 14:51:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQiI-00000000zGz-3wiw;
	Mon, 09 Nov 2026 14:51:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13E6D60DF8;
	Mon,  9 Nov 2026 14:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3DF1F0089F;
	Mon,  9 Nov 2026 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794235873;
	bh=pM4LipmI99ts7wfLn3qsR8+LD0Ifz71Ahhr5FYGBQ4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aOf0s6xzsne0Ce67KvbSWi7+yFLYuu1UzCT0NV+sxtYUffj01d8FsQNIe51ES0kRb
	 LOJ4pdgQq/lgMjCqu5tI0L29yl1+Qgn5Mrvhat02h1C20iJ4FvTqg8lQrKdSILLt7T
	 WCj1uKdtbPgBeFSKKPshOCIhtTntUQ7HeMyqvfC1E7/Z6irjzK8ztlQkC/8Qrk2bkD
	 clTQSOvYjj6C91uMNFJ8jtQfMAykBfYua4hjI6QRJcwLUbp3EwWuvKsGGZvhclkV79
	 QRCxIEWJ8Mdm0YdmdvZ2t5cWjrKz14AYMh8WevL9vinjtueLthPC9rnqJfdCO3/l+x
	 v+CcpGxp0V/Gw==
Date: Mon, 9 Nov 2026 08:51:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Dom Cobley <popcornmix@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v19 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI
 PMU definition
Message-ID: <179423587020.3133545.6594248101575070050.robh@kernel.org>
References: <20261109080126.417161-1-irogers@google.com>
 <20261109080126.417161-2-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109080126.417161-2-irogers@google.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 09 Nov 2026 00:01:24 -0800, Ian Rogers wrote:
> Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
> found on BCM2835, BCM2711, and BCM2712 SoCs.
> 
> The hardware exposes two MMIO register blocks: the primary monitor
> evaluates the System fabric and the secondary monitor evaluates the
> VideoCore VPU fabric.
> 
> Co-developed-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


