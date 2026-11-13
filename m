Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE55606A896
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q381ZEEK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZA6ZT773
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i5j4IdUV7rfFI+fa6P9l+T7WdDrI8Iia9UsGOEW/6qQ=; b=Q381ZEEKgWB1ol
	eAsXyKw7nOzksOv2Uvx4GaLmvHsGR0h+rw4UTwoDLtjIVC6SDmQJwrIVNsCey5mNI5Ae9iwI4urQ4
	3uIU1IOek3Xaxdf1P3VM7X2MoP2riAd7qPZOHgImMYj7QQX5Itl0UwwvCZBJNsO+FN5eq/sAlRwnd
	SkZMFDzbxMm3UScW6Lgwpr8BCaY5fVGNWFJricBgqQQ0SS4hR2DUKdTlpLzhmkH2hG8rXn2BmYfwM
	RVt1wCFX+/bpOMrwAthgaVMRvpfWePkD2ws+Tlzs1MbS1E7HYis6uuU/GjDnS5nBhr8QvM7F4WzzZ
	OwZzMabzJp480a+HxeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIh-0000000BLaS-3uy2;
	Fri, 13 Nov 2026 00:37:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIT-0000000BLPp-0caw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:37:42 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so137513f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530259; x=1795135059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5j4IdUV7rfFI+fa6P9l+T7WdDrI8Iia9UsGOEW/6qQ=;
        b=ZA6ZT773bgm4plh7Ai71Bo3FttfNa2mVDqkpMXxMlm98brZHIJEP4ZEP/Co5OQ0Cnx
         WXkmYEuH7sxxN3SUmvyrIM9ECGK5pz7e0zEotlkizO38W8tXUXmMgbYp5qCvaJ0meO7t
         wAP7nW5/LenRD0vN9bJZPnTIhH0aY1Pm5tYI6DQrrpqUUg4Bph4qQNWzjZZO8qbjiJGo
         c6mDuUHUr/kdiSWSRdMrzR4MRKIL7pZ/SlKfbhAZI4bEBQtItUl7lp3aeaRhue7KY6aC
         ylZgWWJpgRR44Ayj7l2yV/AfT270XMFpcGBWBRMTrG73yHMvCJzypLFJTIaQsJ12jWPQ
         j5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530259; x=1795135059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5j4IdUV7rfFI+fa6P9l+T7WdDrI8Iia9UsGOEW/6qQ=;
        b=NZh90Ee96N/h5xVrNXe+B+I4ciFAdmbwpeW9cc1PQsctVuOm1RlURc+msQN7tr4f6e
         eLwM6DVZwipAgbBweXRIKWtYfFfsuMXpuUBh4zs/NPNb338I2Toj0v1s1ySJdjHbcZZ9
         Wgm5TxujE73Rum3nkfsi+KfcqCpu53yhq8Cxn2ICS8MmWwtYxoQqxkfrHKvhIzovS7Kj
         ZA/hjuyU2RHVFwsMW3U2hpUOW8h+T5kYvFz2R3/OfF3nwZlHfNSc1s68yu4zu5//CK+V
         qAXEwv17I8K0eBkF5DgXqTJLazQbJhmn775xYiiwLrLG41NHzgJZRPtBpCqLjTEQohCB
         wYRg==
X-Gm-Message-State: APuU4Z/v42sOE1A4X2HLpUhJTbwEToSam8gftnjfutq/AbsNOlGrJvlm
	5WLb6Of7rO/mILBscz77qyKHFuDbnyJH+8p4aCAyUDWddCvVVhP7qTUT
X-Gm-Gg: AYBFou1h+6xpmtotE17F9MBCbwBUxqULYo9Gk+YvpYGut+0DqO7KFc7Yq++ZVQtzR66
	UrEiY8pBhVrHlOz1tfZIaKzNjaqlwjhN9FzC10s2JAvQMWxAJu0e379a69hifJZiI/x5XTqm8Ro
	qg3aJSBx+PPCt+RJoy8SJq5d88qHQrAsTmP6v4NK78C7q1X5eigMrhpgzz2jtO0CLIIjZZPQOhf
	3KxdcX+jYVRUMbkL/LSlMNthFFp0UX6ptgGFFW/BYdrxjF6qi4ov2y9iuDsm9Y8u6fjI3bivOzA
	oqknnLCH37p2XJadpQqHm5B0sRG2KM2v0mVJB3gngYL88LhFh5Rlox8k0Tk7JFKBaIuKb09Lz5X
	523ivQeGFk5sdUHd2RG3xMW9xPdg6tk/vBgIMRxvwnwUC0pjmaBpce1yofEBumDWPmp44oXobYC
	O5umEaADy3rz4qB1qy3INoCn7fnxg+JcXF8xkmD/hxSTICPA3TqgO3kq8ZZzGLvyB1VdOuKXDGQ
	1tZMS3oBZ6P6vsrVpB1uBGO088Lu8RNIx6q8I3P8k0/qaeX0AXPJ8avcvAz3/TZWDFdeooJfXqH
	kdtBnyLxNtNXh9HRTDNHtrs1/Um7hGf1bvp9LbgFwgytvI66md9HJ7kZAa7Jaf/0CQuU0UYLufe
	CKcpbMt0fp1lvpM6Ri/IzVXvJ3BsJ5r1A/yRYr3qHocNnT1rUCPsICw6qFjOj30nj+9t/P67253
	8lXzm2aGIMHCGtJm45
X-Received: by 2002:a05:6000:26c8:b0:491:8462:20cc with SMTP id ffacd0b85a97d-49c73ce5e65mr2081140f8f.37.1794530259311;
        Thu, 12 Nov 2026 16:37:39 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm1866976f8f.7.2026.11.12.16.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:38 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/24] dt-bindings: phy: Add ZTE ZX279128S PCIe PHY binding
Date: Fri, 13 Nov 2026 00:37:38 +0000
Message-ID: <20261113003738.3668081-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-celestial-wealthy-cockatrice-7f100d@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-11-ghahramani.navid@gmail.com> <20261015-celestial-wealthy-cockatrice-7f100d@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163741_277644_F2626F58 
X-CRM114-Status: UNSURE (   8.21  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> No, that's pointless. What is this index meaning on the bus?

It had no meaning on a bus. It only told the driver which of the two
PHYs a node was.

> No other resources? Then this belongs to the parent node.

Right. The next version drops the PHY binding, topcrm gets
#phy-cells = <1> and the cell selects the PHY.

Best regards,
Navid

