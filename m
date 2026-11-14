Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCE606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 23:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WwNMEpUD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YEXoGF/IDM5Kwcu5RSHR6PL4LC33xulQf2BLi/eKlAw=; b=WwNMEpUDW7tHvylohig7x1QMOg
	O2sJZHCKmPjpNADkb2ncFrUi92Da8+Ij5U2FJPSsl7amz4QIw1X/QJcv01oc3r9kQZGZ9Il8yDPnp
	xC/w4sl0bJOHgMXj6PTl/3wh2PVPbCMKqxxCFG6rOoVgSG+WdzbRY4fmMOYqAPJ6FEJ+XTv4GOYom
	IqjdOOTOXBsK4Bgp4GNkVqRJOvnjMAjV1YKUANDE9ibNb95ksMBBgSs3mVX2aKxB/2+kJQuftgkHB
	85usH+gaM4hvSFGY3jYbp9zN2BO1+T6HpFNawxD5Ef5kFbTzNtdrTmWID1tf+jvaBt2yUPUz/2oqi
	7o01QyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNbG-0000000Gu9L-3KGP;
	Sat, 14 Nov 2026 23:56:02 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNbD-0000000Gu8l-1mVG;
	Sat, 14 Nov 2026 23:56:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSNaz-00000000811-2Dg5;
	Sat, 14 Nov 2026 23:55:45 +0000
Date: Sat, 14 Nov 2026 23:55:32 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
Message-ID: <avj09DS5ZHCbMt_Y@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
 <90878fc566a9752eb582a82d1324d811ebb324e7.1794654074.git.daniel@makrotopia.org>
 <b4d6cc36-e986-41ce-a887-d7d9076cabd4@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d6cc36-e986-41ce-a887-d7d9076cabd4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_155559_485528_2166D8B2 
X-CRM114-Status: GOOD (  14.98  )
X-Spam-Score: -1.9 (-)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 06:57:46PM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2026 12:09, Daniel Golle wrote:
> > From: Christian Hewitt <christianshewitt@gmail.com>
> > 
> > The video decoder in RK356X (vdpu346) is described in the same way as
> > the one in RK3588 (vdpu381). A new compatible is added as the decoder
> > capabilities are a subset of the vdpu381 capabilities.
> > 
> > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
> > Tested-by: Diederik de Haas <diederik@cknow-tech.com> # PineTab2, Quartz64-A, NanoPi R5S
> 
> How v1 could get it?
> 
> Anyway, drop, not applicable here. You cannot test a binding on PineTab2.

This patch was previously posted (see cover letter) and received a
whoole-series Tested-by. It's true that for DT bindings that doesn't
make much sense, I just mechanically copied the tag to the patches
which have previosly been submitted and weren't changed.


