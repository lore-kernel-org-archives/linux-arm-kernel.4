Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D84606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gS6u+Lo0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aIZ2PgCC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tM8SXc9WGf6iPLFbf68oH/I2l2oZdLX38iKCsqiqJkY=; b=gS6u+Lo06GDikH
	xoGPrV0x28fbwdCCYVCxxRzolDhSnj8ErKsb5h93emDG3Th0bd0ZHmkKWcThNmeOFCUrnian4scEg
	wTSlZkFRa9Oeo1NwQ29tOG7ZFGYXdg9a3nlEyXl8xfIHcRoUQrYBhsLp3uo2CxQ9/z5mr06HncsBt
	emzN7ncNY9T/bMA9GbNhHEdjQUOYmbw6SdqJp6m0pz6O6D7im8DmL7l92ZzPOkaeYnZK84ZL1z/5w
	GZ+kmoZogO/0GXfKAXfdlRNS57YnaTv1ZSLeYJs6avx4adn/GIuajXZI0LECQq0fOrsqd53ImOImA
	ItA2Y+AvEVYB2w3kPIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWurC-0000000G2Aj-1RAw;
	Fri, 27 Nov 2026 12:15:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuqt-0000000G24Z-0KD8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:14:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 858874049B;
	Fri, 27 Nov 2026 12:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEA71F000C1;
	Fri, 27 Nov 2026 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795781694;
	bh=tM8SXc9WGf6iPLFbf68oH/I2l2oZdLX38iKCsqiqJkY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=aIZ2PgCCSdBh7XmzcJDpf7YgWkZ8/PzA4YV/zcGM11or/4gPkPdmyzwzeb9vzZBJU
	 2zInaHrgLawwRJSVDG3/2z8/A/J4ua/wchlgufVddjLb2qXuTzOsHq19DMrOjjlYGo
	 y/d6vI+nO6hHY28DEzoq5C0Ugv4xhzLEPQkjO/3kYBlbt4wFZbQtZtG6pM2qMSnsNm
	 mqIcvp7NHajVYr5/7FUdPyuZAGi6I9T5LKUUwGzQz13mMpGOZSC6LPs/5t84y60w3O
	 uVvR8ajJcLWMClOKml8jHc6pnzWmLQNzRta+n958LFQOaxkvMwk82yGQjzF3k9H3W1
	 hhLpTPbUqqsGA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 5/8] dma-mapping: Introduce lendable-dma-pool
From: Sumit Garg <sumit.garg@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
 akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
 ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
 ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
 danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111110738.872947-6-vdonnefort@google.com>
References: <20261111110738.872947-1-vdonnefort@google.com>
 <20261111110738.872947-6-vdonnefort@google.com>
Date: Fri, 27 Nov 2026 17:44:23 +0530
Message-Id: <179578166371.172025.2529658384273765570.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=sumit.garg@kernel.org;
 h=from:subject:message-id; bh=Sx4ywZBhiyullZrUtgY82SttR0yq7G5O52iMdmFQsBE=;
 b=owGbwMvMwCV2RWpxpe9rmzmMp9WSGLI5S3Q33F0lUXiz/xDP3tOl0RxvDeZkfjTJm7Dr88pGL
 puQ1PbbHaUsDGJcDLJiiiypX79N2yb0rzbU6gQPzBxWJpAhDFycAjCRZAZGhm7vDu0tNkxffpat
 f6wmaad/knepippM+rqdy3k+Zk3OU2H4X/fAReDjgWa2WUuZ9tT9XZR/OTpDcP3+JQtvMH1bE16
 pygYA
X-Developer-Key: i=sumit.garg@kernel.org; a=openpgp;
 fpr=65F5F696B612FE7D553AC80CD41AA3794DEB3C9C
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On arm64, when memory is lent to secure world (e.g. via Arm FF-A), fatal
> CPU speculative reads can still occur while it retains a cacheable
> direct mapping. Introduce the "lendable-dma-pool" reserved-memory CMA
> driver with dma_zap_direct_map() and dma_restore_direct_map() to unmap
> pages before lending and restore them upon reclaim. Devices use the pool
> via "memory-region" or "linux,cma-default":
> 
>   reserved-memory {
>       #address-cells = <0x2>;
>       #size-cells = <0x2>;
>       ranges;
> 
>       linux,cma {
>           compatible = "lendable-dma-pool";
>           reusable;
>           linux,cma-default;
>           size = <0x0 0x4000000>;
>       };
>   };
> 
> If no lendable-dma-pool node is provided, the API falls back to
> can_set_direct_map().
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

-- 
Sumit Garg <sumit.garg@kernel.org>

