Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09CA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=umg16bAr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XZNd7Am/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SmLZ8gf1GKBz7EI8vmfSH7lLCzmVzRkRLb0jnz0/qbk=; b=umg16bArWT+cLfoAfJItPaWNBe
	TiuIJyoc52b8ec1lNgKvp/J3ZwItKmf5Nhk4vkP7xHotCXObLPs/QfZh5QGrn5cs1nllo43B8xUNB
	IJ4PqUkBFYXE0YjxbvXDD7JQYdTppObU5S8HN34qAm+cpkcUqOiVdWyzPIskgYC9OMJyarrc3+8Iw
	BLWUhvJVc26PvaOdkHUcIosCqAZby6GRJiOkCTnJmQFM3cxpMVQxZUXukZHLlCX3PZ9l5vVaJw1Wi
	ONUwfABwDIdk2w8nOZkr4Q1TbwVoHH8C+PP7u4IRmPayrJmIQbQTrmNFr++JuCPS4jF9T79+EJqFq
	HgJJOm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVUp-0000000ACQo-19se;
	Thu, 12 Nov 2026 14:09:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVUo-0000000ACPt-1brk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:09:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A7CE561282;
	Thu, 12 Nov 2026 14:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213BF1F00A05;
	Thu, 12 Nov 2026 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492585;
	bh=SmLZ8gf1GKBz7EI8vmfSH7lLCzmVzRkRLb0jnz0/qbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XZNd7Am/j2siX5Bd4nG4XDFcC61MusmSOn062NE0PVt+q1l5BHBXMWjmuVxKwlocd
	 sUlxcuWxs7+4FaEUeLOATmg+F3XyC4tjkpMo0oZ9kmoDfe/eJB80BssqOZ11c2V7Yp
	 N7D0PZW0nPtNxgWzPcqWIpiIg8FXcbtr+IawNhlPm11pqotdYaH4pRQtjCSAxomHMs
	 rt6B2Kxe3GvRL1sG2IWxUuTSZAmlyUtCy5+xDcP79C2yUjIiea6WCjbYmWmCZNnxdL
	 x7VkDDdxx0pYCwPN27hWU+aEyxZldmtkQ3Rn9xXPDBR0XVjn+GazatHC28+dvdIkBA
	 3gl9W7Exo5TSw==
Date: Thu, 12 Nov 2026 08:09:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, bmasney+clk@redhat.com,
	michal.simek@amd.com, devicetree@vger.kernel.org, sboyd@kernel.org,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: convert zynq-reset.txt to yaml
Message-ID: <179449258263.406339.11789920788113048063.robh@kernel.org>
References: <20261111150812.1874449-1-radhey.shyam.pandey@amd.com>
 <20261111150812.1874449-2-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111150812.1874449-2-radhey.shyam.pandey@amd.com>
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


On Wed, 11 Nov 2026 20:38:11 +0530, Radhey Shyam Pandey wrote:
> Convert the Xilinx Zynq reset manager binding to DT schema format.
> 
> The reset output list is kept, hung off #reset-cells since that is what
> the numbers describe. It is preceded by the encoding the text version
> left implicit: the cell is the register's position in the block times 32
> plus the bit number within that register. This also explains the gaps in
> the list, which are reserved bits and, in the case of 0x23c, a reserved
> register.
> 
> No dt-bindings header is added. Unlike the firmware-defined IDs in
> xlnx,zynqmp-reset, these indices are derived from the SLCR register map
> in UG585, and no in-tree device tree references them.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  .../bindings/reset/xlnx,zynq-reset.yaml       | 99 +++++++++++++++++++
>  .../devicetree/bindings/reset/zynq-reset.txt  | 68 -------------
>  2 files changed, 99 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reset/xlnx,zynq-reset.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reset/zynq-reset.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


