Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 23:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PS55Bjyf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=bahWWZtl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6OGx1XmvR4VQSMtCunhvhj/SAy3XKm9gDW0pRMSvWtQ=; b=PS55Bjyfkak7TK
	dA1TQuEtznVkC+tMj7G+iNDjSLyoVf+LG4WoN+B4pz2zYtghf/ghCAxJa4h01AbBbdG/EW9ivJ5p0
	VeP5bJlQGYtFujtlWRQ9aTv/vuSHe7nVeLLXu+W8g1bPMSpxxhsZ2wveG98QC/F7SfuisPptk8GfM
	i+RPlp2Ss4ac/CAGi1t2zKuVn2tIagqLLLQwT1DWTlgskUq4xlwgDkVpP7LewQA8FJs3DNqyIABVF
	Lep292j+28oCjKb4yqQXk31FVd9TQ69aqOFyz/fbgKDXd3mFJEFCPWjELWUMzM3QKLmnU7A4cJpxa
	VY4nLFz79ogiWtLyI/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvc6-00000005Ggj-3ymj;
	Tue, 10 Nov 2026 23:50:54 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvc3-00000005GgA-2JI1;
	Tue, 10 Nov 2026 23:50:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794354641; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=EmDBqOAib7RPXs2Io35hafHp06Hu8sNthICZOfB8436c4fJxyM9K9xhpSByg1kigzVuy/x76YyssPzVCVqW+rvhpOkOwUB261nfiICr22l2l5Z4cszJwVUM3NfA19KgM9iQzCj5FXRFrhJwHbHoemfSW5vG/khZcaoRW7pGdoCk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794354641; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6OGx1XmvR4VQSMtCunhvhj/SAy3XKm9gDW0pRMSvWtQ=; 
	b=FCNoKGcgVXUbIPq+vnn3rxyBAnYqhKEiOY8Rwvu3h3oBYJHnL418VXLdGhrM3A0sFy8LV8I+awBiwxhqq8aBptLfXu8kVO5ug5u/BoY5GDuEwMr8KFodwj9qvE6tIMzDpz8iKNVXcWsae+tHqhtiWKZdwkXVng/wEGk9yzcdKsM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=bahWWZtlIwNX1VYG4dzqH49d9CZ7bv4qhRrXlRBuzmiXDRUV3OqPoEEAyzQjRapbU3UIJ9dJTKF10km2gaFVn/fcMf0gBzDT5j+q3lyyRlCuTc9NpUEJpQQ/bSA+n1O6TCZx3rq2BgCZWHWTGSUbtbKNSRHhlU+8ucReRvAzmiM=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=6OGx1XmvR4VQSMtCunhvhj/SAy3XKm9gDW0pRMSvWtQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794354638934632.5692174558644;
	Wed, 11 Nov 2026 00:50:38 +0100 (CET)
Date: Wed, 11 Nov 2026 01:50:37 +0200
From: Igor Velkov <iav@iav.lv>
To: Thomas Gleixner <tglx@kernel.org>
Cc: John Stultz <jstultz@google.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH RFC 2/3] alarmtimer: Choose the wakeup RTC by sleep state and priority
Message-ID: <20261111-re-tglx-alarmtimer-rfc2@iav.lv>
In-Reply-To: <87qzgsth2g.ffs@fw13>
References: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv> <20261104-b4-alarmtimer-rtc-priority-v1-2-e996681b8086@iav.lv> <87qzgsth2g.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_155051_912159_7C7EFFFF 
X-CRM114-Status: UNSURE (   6.49  )
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

On Wed, Nov 11 2026 at 00:14, Thomas Gleixner wrote:
> So this gets _ONE_ suspend() and _ONE_ resume() call and nothing more
> and everything falls in place and is comprehensible, no?

Thanks, that is much simpler. v2 will first replace the freezer_delta
handling as you sketched, then add the per-state wakeup_ctl with one
pseudo device and no priority, and reject suspend into a state without
an RTC while an alarm is armed. It will be based on tip timers/core and
follow the tip style. I'll also check whether user space looks up the
alarmtimer device.

Igor

