Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769BA606A8BE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KOyvYbYG;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OflXsdf1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LxlvDU/4QCNusug68G4LKS9QTwaEvL3BD/53nUc9d4Y=; b=KOyvYbYGVSpi5xHN9xaYsgFgiG
	M0sbS2xgTyQ7aEj+1tp8ef3JyCUbsOGfrhaofvbSmUsZywUowY3kzJ7FZj5pmbpWjstp1qO8Ai3tp
	eKToW2RhHXod3qJupKOql5XIKsjuFh9PytsPiwV99RGMiN3+FdVaqpyOfCaOLEp9E2Yjn2yPAeXqd
	dkHWcFsxMnTyX1951MogNjgqaAYx72ZO+CTYoH1I3IhA/v6f127WRfzY1WvruGREWoj+jbrJX+0lX
	hM1sUyTx7ihUgF1mQVAeDLtngej1bgToyQwgoCAofmt6NZQShfXQMx9sX3eu/1856tVg/UxsRXaVv
	xX3J8xdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBxI-0000000FtfJ-0xOs;
	Sat, 14 Nov 2026 11:30:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBxE-0000000FtdV-3K8D;
	Sat, 14 Nov 2026 11:29:58 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD3A5802;
	Sat, 14 Nov 2026 12:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794655645;
	bh=enYAqOd6eck7e0RpfjoVDMLIEaqqz3LnOMzk6zUIvm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OflXsdf1vosoudWfIFZuUeaIuqOogOYTbqjaxknNjmbswZryD2wORtnvkavvIIHbz
	 H+IHsHL3P+IvyNrItpn/RYjTl97PknE6SxYx5veStY0Ly4Y3TUkClvyh1bV6USBmu6
	 m7tUxFEwWdaX6+UYOdpxEvWXaJ/jGkmPKiVYM2xM=
Date: Sat, 14 Nov 2026 13:29:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>,
	Kees Cook <kees@kernel.org>, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
Message-ID: <20261114112949.GB836589@killaraus.ideasonboard.com>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu>
 <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
 <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_032957_298584_B41983D8 
X-CRM114-Status: GOOD (  21.64  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 07:25:35PM -0800, Florian Fainelli wrote:
> On 11/13/2026 10:09 AM, 'Martin Wetterwald' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> > On Wed, Nov 4, 2026 at 3:20 PM Martin Wetterwald wrote:
> >> On Thu, Oct 22, 2026 at 3:31 PM Greg Kroah-Hartman wrote:
> >>> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> >>>> Hi Greg,
> >>>> this is a regression introduced by aa125180c673 (via your tree) in
> >>>> 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> >>>> 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> >>>> staging-linus would be great. Thanks!
> >>>
> >>> This is not a staging driver anymore, please route it through the proper
> >>> tree after -rc1 is out.
> >>>
> >>> thanks,
> >>>
> >>> greg k-h
> >>
> >> Hi Florian,
> >> Now that -rc1 is out, could you take the patch?
> >>
> >> I've checked 7.4-rc1 and I confirm the issue is still present.
> >>
> >> Thanks!
> >> Martin
> > 
> > Hi Greg, Florian,
> > 
> > The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c)
> > is currently listed with Florian as maintainer by get_maintainer.pl.
> > But Florian tells me he doesn't maintain VCHIQ.
> > 
> > How to proceed now? This file doesn't seem to have any maintainer as far as I
> > understand.
> > Any pointer to someone able to take this patch would be appreciated.
> 
> Sorry for the lag Martin, I will be taking those patches from now on.

Thank you Florian, that's very appreciated.

-- 
Regards,

Laurent Pinchart

