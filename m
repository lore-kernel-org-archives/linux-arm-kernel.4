Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73816606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MhIc7bwD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=NjlZu8y2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=egF/b0XrxAn1ts7Isj8Iu+j0r+ysO1k1OHUcpzWFCjo=; b=MhIc7bwDsHfWDnCxg4rUsW1ScW
	2cRMGQOoiRLNY5HbBlLXt5/wDqGjT/dq+4MuUqEpO/lhODumdt1s/GptLnskFMO7GWWxd/eUuD8DR
	Gbb72RC9dlY32GjDz788Cnrfp0qdreZqOHCiQaeiqsgnjR/m2Hc/zDsskSref9RnNOCVwLbC4r1ab
	qyaJ7HG7Cmjhe2tNYLpcYgjF3Sg9lgqqQEVuKJh7iX/q/2k7E/B7yUsThtr965OZzmAjoX5K37V+k
	0PH31IV5WVv0UjBjDKzggjyvuJQAQZgQE5qADUUnMC/s6HEGP/mf6xEAzc7bECNML2M/fI72RtuxZ
	qYfQhfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4Uj-00000000x8e-08cr;
	Sun, 22 Nov 2026 10:08:25 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4Ug-00000000x7H-0Qyg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 10:08:23 +0000
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id UykDxDQBTOOJnV4UUxxGcA; Sun, 22 Nov 2026 10:08:10 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id V4USxKOq3YskhV4UTxSKBp; Sun, 22 Nov 2026 10:08:09 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6b02bf09
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=PFCYaXOscNU-RV6WzkIA:9 a=CjuIK1q_8ugA:10 a=7RSCp7fvD1wA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=egF/b0XrxAn1ts7Isj8Iu+j0r+ysO1k1OHUcpzWFCjo=; b=NjlZu8y2feg8bE2w8v5NEWYFQx
	xvETgBJi0NT8F8pndiPDvAo1ZG6ucvXK5+Nge+NBmh40YoxlqI6DZ4wy1o0ngvKkP3AK4/PBm3o85
	b6HxdOl8pKd3XMkVxd0sJHJ0hglDYLUHb1Z98qTmtapgKdCYVbkRNffThgjhhoxRi+4XS97D08dVT
	Yb/BUqsBY8ZMBOimoRQk6Pp/igHVnFUbNIPcfEqWi7maNRQWSiswlZHNt5xcnGXn5+Q19P6WO+7Jz
	DbWKa08qtcMdoBYEJoGEg400zQ3iIdhDmiCiJnvA9L5tuZAZiFKzDGyMVhLStu2P5Gxo63PYlm2+R
	jtxHAoJA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36998 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xV4US-00000004BEP-2btM;
	Sun, 22 Nov 2026 15:38:08 +0530
Date: Sun, 22 Nov 2026 02:08:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Artem Novak <artem122novak@gmail.com>
Cc: wim@linux-watchdog.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-watchdog@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: bcm2835: add newline to dev_info message
Message-ID: <7ec5f7ac-0ede-49e3-8f2e-4ac5a04ec806@roeck-us.net>
References: <20261122082943.173681-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122082943.173681-1-artem122novak@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xV4US-00000004BEP-2btM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36998
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBSi7+X8nPTTj+VMz9oVRu5g9Fg4qeO0cqYctOkXQLgXEF9WpujuZzCP7t2ZlrL+4vOCPB7mI1cZyoVFXZOkYKoUSpW5EAA2G9so9i8XITot7/fc9Tob
 157ZU9ZfmL8gionBgl8tQOaqMdpiAOXSW+FyiguaY7BAHtdF1xCEEhPVzmRTkuFvF7z/oaQrFC/IC9V1Y7xoD+R2/loquyOF9jbY9Jb5rCQLbbwYY5Ok3Zcn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_020822_229061_A52F5CF1 
X-CRM114-Status: UNSURE (   2.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
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

On Sun, Nov 22, 2026 at 02:29:43AM -0600, Artem Novak wrote:
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Checkpatch says:

WARNING: Missing commit description - Add an appropriate one

Guenter

