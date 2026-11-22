Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87C9606A338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Slm8KsJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m07oiY0Vuhff4sJHiKKC4hdtDmMaphFBUONvRhgCu+I=; b=3Slm8KsJU5gA7xD7PWzSwRgkJu
	4lEM/FdBSh/n/P63wUMzpKf28L0KkzU+BDaik7WohnABnPGVsUr1F6O4aIIsvDPZq9hRNOprqmm9T
	1mzu+pp1WEfodCCcZRneTV8aD8ib2MrJPjXOaXjxai3cL+Tas9tHLepJxW3DnahBIZAHhBYNqXJBX
	E66dNGKJ2/Dj8Eumhb5YgJV7Kd/UIXapdw5+XU/XrYN6wTZ2K3alDL3NgFdhZ5eLrQ8H9NeFI3A49
	OvhGWOgddgSKxCB4oAt5f78DhdSeoF1bbmN7hmF66p4j0Zgh7/zh1+l8XSmkcMOZqpoh9xSih52Jz
	JUOhUybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5GY-00000000znU-20Mu;
	Sun, 22 Nov 2026 10:57:50 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5GV-00000000zmf-1sPS;
	Sun, 22 Nov 2026 10:57:49 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xV5GF-000000001ns-33UE;
	Sun, 22 Nov 2026 10:57:31 +0000
Date: Sun, 22 Nov 2026 10:57:15 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dang Huynh <dang.huynh@mainlining.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v5 0/5] media: rockchip: rkvdec: add support for the
 VDPU346 variant
Message-ID: <awLKiyI-z6wdTD4C@makrotopia.org>
References: <cover.1795191822.git.daniel@makrotopia.org>
 <E8475BAC-F137-493E-B7AC-9C81FB158610@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E8475BAC-F137-493E-B7AC-9C81FB158610@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_025747_515856_2E05183B 
X-CRM114-Status: GOOD (  26.40  )
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 11:44:32AM +0400, Christian Hewitt wrote:
> > On 20 Nov 2026, at 9:36 pm, Daniel Golle <daniel@makrotopia.org> wrote:
> > 
> > This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
> > rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
> > [1]; in the v2 cover letter he offered to pass the series on. The
> > previous posting [2] carried no version in its subject and counts as
> > v4.
> 
> The original offer was directed at Detlev based on conversations with
> other Collabora folks who were hinting that he would be able to (and
> it would even be desirable to) fold VDPU346 patches into his work on
> VDPU381/383 which was in-flight at the time.

VDPU381/383 has landed shortly after your initial post, 10 months ago.

Your wording, on a public mailing list, reads

> [...] would be happy to pass the series over to a more experienced
> developer.

I may not have been active in media/drm that much, but am generally very
familiar with kernel development and consider myself reasonably skilled
with C (also "pre-Claude").

As all missing was running the validation suite (and the minimal changes
such as the clock change I've appended to the series) I thought
re-submitting it with the results of the validation suite run would be
the right thing to do.

> However he didn’t take
> the bait and it didn’t happen. The comment is also pre-Claude when my
> coding abilities were more rudimentary. The main reason for the long
> delay in following up has been the length of time it took for Detlev’s
> and related DRM series that permit wider testing to land; a vacation
> over the summer, and then Claude distracting me with a deep dive into
> the Amlogic and Rockchip media stacks that’s resulted in 300+ patches
> that need a proper plan for upstreaming else I’m going to annoy the
> already-overworked media/drm maintainers.

That particular bit, making VDPU436 work, doesn't depend on any of that
future work you may still want to submit. It's immediately useful and
can be tested independently.

> I don’t object to someone upstreaming my patches. I do object to the
> lack of outreach to check on my plans and patch status before blindly
> (and wrongly) assuming there were none.

I didn't mean to overstep you here -- but 10 months of silence and an
offer to hand over the series didn't seem to require any coordination.

> You will find later versions
> of my patches with fixes for changes in surrounding code (as I work
> on something broadly equivalent to drm-tip not Linux 6.18) and from
> further testing in my not-very-abandoned development tree:
> 
> https://github.com/chewitt/linux/commits/rockchip-7.4.y

I wasn't aware of yout Github tree which wasn't mentioned anywhere in
your previous submissions. It also seems that this tree has only been
published hours ago, and doesn't contain any changes related to rkvdec
beyond what is also published via the mailing lists.

