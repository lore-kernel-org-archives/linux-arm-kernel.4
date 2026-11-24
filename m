Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE225606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KxwBIIbW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=I5Afrksl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOYJJs80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=; b=KxwBIIbWESDGC1
	W+dFgLeXaoKrtSub/0sBN1B4xvJq0/1yZVrnmP0Gp5Cj/8nfJ8ol/8PJ+SstlC8a9Bpx6tgEmt7zA
	QCl+XnIxHcQeWzDotEn+5G3eNRHGTH/l2JxzY+L4wvFC06uCoiSus0FTRK/5MXcURyB892+wImxSS
	YM7I/zYr8SWasxWRn6oL78dFyTEBFw7MgLj/1+r7wZKOq+aJuQXuz26nFV+P1wFB5Oz+sbpfRPHVp
	SJOPzzX6EUfAO+W+XUCUvzT39+MZEWyDJGa/Kpif/HCKL54pTrpSqRcYU61/fWdXdaFvpD9bP1WTc
	u+TWDfODSrkmJNTvNWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuPK-00000007Nfi-3LBX;
	Tue, 24 Nov 2026 17:34:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuP5-00000007NZ5-2sAW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 17:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=; b=I5Afrkslq+c497LGyddRgb3MNX
	Z0+MBWRnU/s2IdRBHThozo4FKpjBvkpV1zPS/CIpzPJTfSOzV5dLguQbsvJzBP/zY4f2rf950GHJX
	Bb3j1EeVlV3vcPjx2Q8yViuq1esTvlnAgZ3D2CQdy+S+3gTlfgym7vCy2aLTmjFUTcj2+EG+TAGZg
	Jnm7qMuC38o5Dbdgc5UzmHquHW6C8sEtaoWr+AeXO9IO3cf8YKrB7E6SPWnedMjbDOPJmZO5JUOQG
	1qW/QKMiqNtB0P3bVEvIEqHnnM4X/TL4jJThGt0ANEyVb4X1Rl0PmDpqYzHSaE9EiRzN/EeLkvSrv
	6joMfi5g==;
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuP3-00000004PtU-0VT1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:34:02 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5be4fea434bso5307319e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541638; x=1796146438; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
        b=xOYJJs80t298VccBioUcKLu17+FlDEbPfEwQATPCc3zeWRfB77dvVvrAfpqP9v/EZk
         iihzv2K7rXoRFfg+qLak880TeH9sWhAjl25QcK94ntjI4kkOXV5yuHjqJGwyinjCpfRy
         eH8cYB55A2//CcfTk4EGnqJ3Ywt73p0zaVHbLrR+pk1IBJCao74mSXnh/a3nZER/zlZk
         rfFKJhWzyQ6vjIt0lWodYGxufQi/hXNDdBEAjLpewEtgrYVFMCsnT6HbcT47iw0PSJp8
         4YL7eU4llttmCp7w6i0lcnj+Zd0nNQwj/ZkstCRdVJT2jR6hIemhvOIosd1Ll9vmh2Sx
         wcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541638; x=1796146438;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
        b=RKgS11o7AWp7lF572aH1aN+Ja9z3rI+aHbysWIxvTptSOYtCi/F17unavmJxXaU/m5
         owGnfJP/4a2xWEixrRHVSXBd0ZqDiQUFl+dY4nXfpp8bVMP4tQu4X7DEEdIzCeZEBstX
         u+JdfBGM8h5egPPtnJTNeICwFuGH2gfW8itDDTdVX+OFd4uIljJ3gpppx9+Hhjm5x35j
         tQi5PVfkTJVcWPzQLnWcq0ssogYBCw2X/vZNk6XxwBbE22JIA2Ph6g2JJXK4CS36UCIr
         8iKkRbZRBh7hPOsTHDC5eSQ8sFmO/NbtfbNINX50pTMLq+myPSvQ3NZ3+zmUifvSG1sD
         b+vw==
X-Forwarded-Encrypted: i=1; AL+hErFv3bYVLiFpD0yWRTlHfv2BFKnqArnBhhTANdxuMar8V+Z4SMkBcIjhjjE4DoFTtRi79PDK2g/zOCyIEmFkHvO7@lists.infradead.org
X-Gm-Message-State: APuU4Z/0IOF95i4JtBNNdL8CaLcz8njHiuaZm9g55/0KAkiAQhxVtD+9
	fRao4+/rIFMqHlrQakfNomwyX9/LXvSxKSV1rp3jGHpg4Aue/gzxFzCz
X-Gm-Gg: AZFdTZcJhFkITbEvfLPKxPL1MuTzSlQZn1SNbup3Yz0mKGfwxSno8WkrlkXGeuhst1C
	aNlRUBuI91Govv276j7UqknrzbTZ/c02/eK+u/lN9GCmYOZBmZLknLVRpn0OzSsdc0jlC7zwxa0
	O81glE9nXVCyNJlv01cOuaB8yBO7OHFRansISpbCWZ/JfOFtqjOZQ1tAf1LsH0jr1I+iIAZoEeW
	UHXcTzI6AvKbJ0P1fcU5XPjMJHF3GkgQKAk/+V8XV7U/ON36sAg29Ras2tC5r5I2uLHERbok3XN
	PtoufIKX/BeydaCcD7O6nU8hNUEn+QhKFMlI4IB2nAjcI9xh6Hv1FIDf0OL75SoyFyQhppuksDh
	rbY2azBippUEXZoiQOLn7dQKwP1bahp1bv0aFlSpQTnzekSgmFcNAFGPAcih7anGWcq9gOmmsF1
	tj5vhz+uhcW8jQGBn9XjaDtWJlMCZut6MvXG9YdOeVzw9jb4fAGqlwIpxqaqnrDrHVFh1FBznEK
	JocCOODD+HLLWLqlUw5oWwtpi762XQmtYJRw4SnbNPAKcO9S7HpZRYdSk0dieng7B0dYC0cctgR
	l+zRRw+xHoi1snt0rolUChwZyQIdozb+JxL2k7cZ0z7Re4jlRjLIEC0=
X-Received: by 2002:ac2:4bd5:0:b0:5c1:ac33:5a45 with SMTP id 2adb3069b0e04-5c1b79fc8dfmr4560944e87.4.1795541638132;
        Tue, 24 Nov 2026 09:33:58 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8bbdsm3990097e87.28.2026.11.24.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:57 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
In-Reply-To: <awXFhjXhZ-e_QM_R@x1g10>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
 <awXFhjXhZ-e_QM_R@x1g10>
Date: Tue, 24 Nov 2026 20:33:35 +0300
Message-ID: <179554161506.57.3046327489415683188@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173401_108060_EF3620E7 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.8 (/)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Brian,

I'll move the reset controller to drivers/reset/ and send the CS7542
clock changes together. That will put the strap-selected clocks and
the PCIe gates in the same series, with one binding for the global
register block. I'll fold in the remaining review before posting it.

Thanks,
Fil


