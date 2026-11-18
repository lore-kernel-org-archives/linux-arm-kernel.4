Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF34606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f80g8bdT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5vVE1Mh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IZ8flJOS7vt4IlbZiE/b3qc9/s7rsTbEqNnieP1+rFo=; b=f80g8bdT4KkR3lA/wN9spG5HAf
	JmUghE0aHNXC+F36ahJ8vnbghOxHYjETv7J+B5YjYJOrc67amzinJg7LCpruzSZseDa/sXp1rw+pG
	QNL2rEDVI7+nuEAKXQPifF6rI8HgVbVlpWdaZvI9tbF4slXvE38HGekdIGw8tWuRf7iWn3XykDX+e
	kqNLEUbXkVTF29UnRraYF1/pu4GEI0s4y63BVIlM2KIefcmT6+WTFmsdS1BKLTWEt+Qe4aQVgn+DH
	/+/low4YgiqcqQYe7hgOtjraCh1ZVWTB1Kyv80UuOUAdqEv8x4jU/J8e+TE9npB0wzTzs3Kdgyyc9
	4fwuFtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmLo-0000000ADra-2CNT;
	Wed, 18 Nov 2026 20:33:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmLk-0000000ADqR-2RRE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:33:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2eb33b5c067so1119035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034027; x=1795638827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZ8flJOS7vt4IlbZiE/b3qc9/s7rsTbEqNnieP1+rFo=;
        b=I5vVE1MhdKL7Vqs5GwD32ixStK3D94JZu9wxLMeKO1VJVtaNIq1hBPv4ZSvV/Ds9zV
         +PSMBSv6AlYsC46UC2W2g4KpcPLRPzdwaz8tI6n8PN1dXbxlzdfxGCOUbdBYPD1oappv
         P8wjnx6fZp9/oeI3AbWP4udXBVMnqMsKxtYWXxx8zSrH9NKEvcXaWR59jwdFij3WP507
         iyZ1U4eS3AWoH14rdMtxT8O6dq9sZnxrRuye5suCSK3ishz+k6SJIl43h+FxjiAJ9vfL
         seMVmETKxUiKxTMR5LyQl+trcxKrw7269u/sRe8w4tCJgNeQnGYTAbxcY3bZLwQqScno
         l07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034027; x=1795638827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZ8flJOS7vt4IlbZiE/b3qc9/s7rsTbEqNnieP1+rFo=;
        b=QFW/7D6fzjcwFCwtpGLFAcB1EXSnAtrtmnFWRwhncimysE55bjTQkotYTDpVovEVvl
         BOrm6b6wxnwNw11aU9DTKuZbrzKSKiqqFCqcDvDZJHIWCO/oKzQCWU7vZmbnXe6Krw7x
         HdIGUeg7WiveNp0sfNPI+kf3KQCqARUzkHbOc6bAbWuf/gp/uNcokiMl0ilEc4fWjnIM
         xEowMXA1SM4WszY1zzORjWtaJZU7rFaqaEyrBmajKauauRua05z28odWU4OH5h9RTfQ1
         DcwvoW5aC/MYETAeuZwEipWcIMpynOp0N6Iap2yPc/diyot5Lm1YKPawKox26ww7CVLy
         TIUg==
X-Forwarded-Encrypted: i=1; AL+hErE5GxW5Z48eP8coIPv9rssNpVuNUe+Mp5DB+t2bERhikWZeBAyywzc/5M40dczNq1bk5vbwBrTcOu2CHrU5EQeD@lists.infradead.org
X-Gm-Message-State: APuU4Z8yVp1jTbUFfBdlYzKvV4AsFTrUJVLbY9o/jc/nCuajQfTAw5zR
	J0ZFQVng2s3iLYGdZGElINVX14pUwHDHw83LHlo5JAcGQs1j3VuseK25
X-Gm-Gg: AZFdTZcbLO3A56vAhkrfsJMZTp5WHRQgnDgwrXueZvp+x74THRY/AojgqxS9OD3VYY/
	tkKDcKay0OmX0NIkxwJXQ4XPnM0bLboWS8TBq29Nr5dB01Jt5Qp62r0IIC0lbvo1OpktyYsvX42
	vFtSCO+nPWF/LDOkFe343ziQUzgRUDCcuk8XUHiQdt0HCJEpg6xQWi/SDcGXDehCXizjVPch0i/
	OAY1lvlVe/pUzNO99VLRFo6F8BkNnMhZ9xmbXWrOBXPlF2nm2sFeXSq2KJd9m3pG8uBD7+bVMbh
	p6+BAfTc1gpAGPjmS8EBCzseg5hyp6YmidSDy6O+IPOSBPnieuvzWG03Gz3cARRlS7nccAmrHZA
	bSkR7Rit6/ITKV23ZoMGbLRRZJF9sGZsf4a5uRDShpywKzU/j8YrTrH/uuibBAi2d5ePBWXVSiI
	Y0QGMeTMrvfw+KtjfG5U8WzUp5Fxe3uAseMvLj+qp2IhorxhDowIOhYl+YAa6sZ3bcTu09DqjZ/
	FtiRQShQIOYzFAJ3Acc3hsktsTVypI2kJYU6D2oITAoShJERezkJfmImDSf52hiO/+gkX2Ya7ZZ
	I5SVH8UhRypZ4VdVxtZo9ee2kYxojCwOgBFHQ+q8Vne9jivdO4KIp54pqPZdoA==
X-Received: by 2002:a17:903:90f:b0:2ef:da10:beaa with SMTP id d9443c01a7336-2eff71f59acmr62060055ad.1.1795034027132;
        Wed, 18 Nov 2026 12:33:47 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:52f5:4b00:cfaf:4885:b023:6316])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eff6116331sm19166825ad.22.2026.11.18.12.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:33:46 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 0/2] media: rockchip: rkcif: ENUM_FMT and bytesperline fixes
Date: Wed, 18 Nov 2026 13:31:32 -0700
Message-ID: <20261118203134.315591-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_123348_996890_32F72942 
X-CRM114-Status: GOOD (  11.45  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two fixes for rkcif capture.

Patch 1 filters VIDIOC_ENUM_FMT by the media bus code, as the video
devices set V4L2_CAP_IO_MC.

Patch 2 aligns bytesperline to 8 bytes and honours a larger value
requested by userspace, so DMA-BUF importers that need a larger stride
alignment can use the buffers directly.

Tested on RK3588 (Radxa ROCK 5B+) with an IMX415 sensor, using libcamera
with the GPU software ISP. The DVP part is compile-tested only.

Changes in v2:
- Patch 1: don't filter the DVP output formats, which have no media bus
  code (Mehdi)
- Patch 2: handle all planes and the DVP interface, and limit the stride
  to the line width register of each interface (Michael)
- Patch 2: drop "on MIPI" from the subject

v1: https://lore.kernel.org/linux-media/20261105232310.385463-1-faizel.kb@gmail.com

Faizel K B (2):
  media: rockchip: rkcif: Filter enumerated formats by media bus code
  media: rockchip: rkcif: Honour the requested bytesperline

 .../rockchip/rkcif/rkcif-capture-dvp.c        |  4 ++
 .../rockchip/rkcif/rkcif-capture-mipi.c       |  3 +
 .../platform/rockchip/rkcif/rkcif-common.h    |  1 +
 .../platform/rockchip/rkcif/rkcif-stream.c    | 66 +++++++++++++++++--
 4 files changed, 68 insertions(+), 6 deletions(-)

base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
-- 
2.43.0


