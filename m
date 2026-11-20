Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95858606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 01:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zAiE9g6n;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WfBQiJhr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=; b=zAiE9g6naclt6k
	gfVUGXww6oSPAmBAHov3pv2ERWIkyCGc05+zH/KL4K8ztyNps8fUMUxDSiUe3HxvqnDmwKbkgQq4k
	z422PiWO5LACsZFpM0mEjLclYe4Fodszbn2c9S6H+bP84jQvtRQ7whuLKSo1TGVFwqJHp8olHv6L4
	7lo25dM7atvTY/2KgMGzO1Ben8uVUxt7S+cvD7WWgGwhCiBz3sIHm1bRQ5NYq46BQArVX/ZOp0Mbf
	IU80MS33AJg9Ka4IVWdjGi6BNcXkcpLUsJqkjxaMcGm0y0mHDdxSK3abngruF0Uj4GH3jkQr5UYR9
	rRgxPkDuzo2Xs/tVPkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDPF-0000000Dpp3-3MyL;
	Fri, 20 Nov 2026 01:27:16 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDPC-0000000DpoN-3HSM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 01:27:12 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso172720a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 17:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795138029; x=1795742829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=WfBQiJhrA5MRz9If7HTKCna6M2kshq8OLfxKIbHNeJZ3Fx9SDVLnl9UGZsdhaltBvz
         MXtXoBNRZFuw9PoW0+ZTDUYWjL56BRC/bAMS1eJ/ydwoRY1F2CwI47y+mAAgodFFsc4u
         ZFpokcL+bLOjoRGcNBdp2st5PAz4ZXbqzIGrJD+Mu9/ow8ab3nrenENHVLCVhIi1qGKl
         CL3fBbpuikYFmhm5p6RLqsNn5sz8C8bO7hvuaPwH2VAKQmy235xYI7VTKK+7UMGiNQz7
         N35gRqc7Wicel8JTAgtJYtN3wNqdsG5ggHd/IugDYAWtFbNf1mGDaqSQEV6jKqBCNTCd
         Dtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138029; x=1795742829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=Wnc9eUdApbg3IHHCgRN6q2WBSzkjvjyGtmVRT2TydlxTSEBIRXiAC2SDltixv62b/L
         Jo/Ihfm0jjsk9Ag5pA1c3bbcv15qUT+6TTiAVh9cj5fWMgwFSF5IeNs2V2/4dlM17ws4
         Y9QuL7e6Ew0vCtoFThMhE34oaFq66wS70qiu4m0xySZceO4ohBeUkvetSsRK+FeNoou4
         Ta4A1Bxc0r0BvUlTXULsFDk6sH+Im1m8rnQFjq2IM6Dojftr3StJ1cjDfU7NvtfhBcph
         o9fmvaittZP/bH4LYcWUnfYImfWGjzZdmsihwEp3F3YZUKAFDoelwZNFHH82z8Nhg3Bm
         RPpA==
X-Forwarded-Encrypted: i=1; AL+hErGZD/Ufprw7thP/mi0WW7HS+ljLugpc5W+XUB/HUD6re1Yh6R7JMRJxyUTNkt2W6ojaR86Ief7QlMFe5aX8geLU@lists.infradead.org
X-Gm-Message-State: APuU4Z/DkE8zlXvt3fe+Pd2dDpb8QwHCRmxPBwVed3Wp7Bt0OEfPYsD9
	LOmBAd/0kVusgYj04SaTVSBw3mAg4e7WOzyZNvWP82lqxmgmoNN037ZYlZ/V2U55cA==
X-Gm-Gg: AZFdTZecV+2VxiI3x/wYYkQuhFpYBeRonlsvlnWVYhNmonzMG28zmp6CuHV+fzyaq0d
	JsYmD8wY15U9h8hloihbU+XYdp4uNlB8dyO5q247Xgu5T/78qyHPWqcnhvxBHv30BuUXh5OmXwK
	jgOx991PdEiOY78Ec8nbtoHjzyxACswhLineCLc3H5w+3ZdWV+nUVX57sd2YW3Vik1YfX7GLo6c
	y57iliLDQskdOxd5S6HRJlThttOvTTi3o5fMMX1q5pvNP/+thBc2JPd7TDKVjs3uvm7K4mqh3pa
	QT/brYrVGPStVbQ6cCu8SdIys5+xwOgJ+8Uc/3R13uatbdb7Tm8+J6bA17XWN/vv6Maso0XmbAs
	uARaE+LTczsLZvhIgDgBOB7BoEC3l6/+Y6O810MxnjL2sHVXI4qGLmxcKKzYKkGR6l8KZMaezkk
	Ue/JSzZw9XwBVyO56NBIgssOrdSP9hqDdygLGD6s4eYtOCWH3ZkRIeBZCnMb3YlmYbZz+8KM6ub
	eIPabGc2XyppQyx4649IHjPv1Zb+PxLoBQz8DzncPFffGEL9fI1ZID8Nos/yDvhOWS7ooDcepUW
	rrCTPg6YejYTUxmjCkufHqNK9wqZCBTjCrZF29r7h/s1lmskctyjiLHFu/xB+4XAea/NO4UEacU
	MnEwa1B/Nn/cMOXN/
X-Received: by 2002:a17:90b:4c0b:b0:3b4:12a9:2e1 with SMTP id 98e67ed59e1d1-3b41c931d36mr1334543a91.33.1795138029298;
        Thu, 19 Nov 2026 17:27:09 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm1763326a91.4.2026.11.19.17.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:27:08 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Rob Herring <robh@kernel.org>
Cc: netdev-bot+sashiko@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	s-vadapalli@ti.com,
	rogerq@kernel.org,
	bigeasy@linutronix.de,
	martin.kaistra@linutronix.de,
	vadim.fedorenko@linux.dev,
	r-sharma3@ti.com,
	robertcnelson@gmail.com,
	nm@ti.com,
	vigneshr@ti.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Fri, 20 Nov 2026 08:27:00 +0700
Message-ID: <20261120012700.1878745-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119230614.GA1147583-robh@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org> <20261117004133.1594972-1-jjc@jclark.com> <20261119230614.GA1147583-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_172710_875188_B5443E69 
X-CRM114-Status: GOOD (  19.05  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rob,

Thanks for the review.

On Thu, Nov 19, 2026 at 05:06:14PM -0600, Rob Herring wrote:
> > There is no other user in the tree currently. If in the future something
> > else in the kernel wants to use it, then the solution would be a small
> > driver to mediate this.
>
> Would doing this imply a DT change? If so, your binding is not future
> proof.

I don't think a driver would need a DT change. The property only says
which CPTS input the GTC push event is routed to. It does not say which
bit the GTC exports. The role of the driver would be to mediate the
choice of bit in the GTC_CFG0_PUSHEVT register. The driver would bind
to the ti,am654-gtc node. It would not need a regmap of its own, since
the register is ordinary MMIO, so the node can stay a syscon. The CPTS
driver would use the same phandle to find that driver and ask for the
bit, instead of writing the register itself.

> Not the kernel's job to validate the DT. If something in DT is optional,
> then whether it is missing or wrong doesn't really matter.
[ ... ]
> Is that true for *every* kernel version? Again, better user experience
> IMO to just warn if something is missing and continue on enabling
> whatever you can.

On reflection, I agree. For v2, if the ti,gtc-push lookup fails, I will
make the driver warn and continue without enabling
PTP_SYS_OFFSET_PRECISE.

James

